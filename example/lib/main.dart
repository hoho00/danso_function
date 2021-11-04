import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:pitchdetector/pitchdetector.dart';
import 'package:danso_function/danso_function.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_midi/flutter_midi.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatefulWidget {
    @override _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    PitchModelInterface pitchModelInterface = new PitchModel();
    Pitchdetector detector;
    Pitchdetector detectorAdjust;
    bool isRecording = false;
    bool isAdjust = false;
    bool isSecondAdjust = false;
    double pitch;
    String yulmyeong;
    String pitchStatus;
    double userInputForAdjust = F_FREQ;
    final _player = AudioPlayer();
    final _flutterMidi = FlutterMidi();
    Timer _timer;

    JungGanBo testJungGanBo = new JungGanBo(
        "늴리리야",
        "세마치장단",
        "Y|Y|Y#J|o|o#Y|M|Y#J|o|Y-J#t|t|--t#t-J|t-h|m#h-t|h-m|y#j|o|^#m|o|o#j|m|t-h#m|h-" +
                "m|y#j|o|^#Y|Y|Y#J|o|o#Y|M|Y#J|o|Y-J#t|t|--t#t-J|t-h|m#h-t|h-m|y#j|o|^#m|o|o#j|" +
                "m|t-h#m|h-m|y#j|o|^#"
    );
    @override void initState() {
        super.initState();
        detector = new Pitchdetector(sampleRate : 44100, sampleSize : 4096);
        isRecording = isRecording;
        detector
            .onRecorderStateChanged
            .listen((event) {
                setState(() {
                    pitch = event["pitch"];
                    yulmyeong = EnumToString.convertToString(
                        pitchModelInterface.getYulmyeongByFrequency(pitch).yulmyeong
                    );
                    pitchStatus = EnumToString.convertToString(
                        pitchModelInterface.getYulmyeongByFrequency(pitch).scaleStatus
                    );
                });
            });
        detectorAdjust = new Pitchdetector(sampleRate : 44100, sampleSize : 4096);
        detectorAdjust
            .onRecorderStateChanged
            .listen((event) {
                setState(() {
                    userInputForAdjust = event["pitch"];
                });
            });
    }

    @override void dispose() {
        _player.dispose();
        super.dispose();
    }

    @override Widget build(BuildContext context) {
        return MaterialApp(
                home : Scaffold(
                    appBar : AppBar(title : const Text('Plugin example app'),),
                    body : Center(child : Column(
                        children : <Widget> [
                            isRecording
                                ? Text("Recording...")
                                : Container(),
                            isRecording
                                ? Text(
                                    "Recorded hz from mic is : $pitch and yulmyeong is : $yulmyeong and pitchStatus" +
                                    " : $pitchStatus"
                                )
                                : Text("Not Recording."),
                            TextButton(
                                onPressed : isRecording
                                    ? stopRecording
                                    : startRecording,
                                child : isRecording
                                    ? Text("Press Me to stop")
                                    : Text("Press Me to run")
                            ),
                            isAdjust
                                ? Text("Adjusting... Please play tae")
                                : Text("Current Standard $userInputForAdjust"),
                            isAdjust
                                ? Text("Recorded hz from mic is : $userInputForAdjust")
                                : Text("Not Adjusting"),
                            TextButton(
                                onPressed : isAdjust
                                    ? stopAdjust
                                    : startAdjust,
                                child : isAdjust
                                    ? Text("Prees me to stop adjusting")
                                    : Text("Press me to adjust")
                            ),
                            ElevatedButton(onPressed : ()async {
                                await _player.setAsset('assets/arirang128k.ogg');
                                _player.setSpeed(0.8);
                                _player.play();
                            }, child : Text('Cow'),),
                            SizedBox(width : 10),
                            ElevatedButton(onPressed : () {
                                _player.stop();
                            }, child : Text('Horse'),),
                            SizedBox(width : 10),
                            ElevatedButton(onPressed : () {
                                playOneYulmyeongNoteDuringDurationTime(
                                    YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
                                    FAST_TEMPO_SEC
                                );
                            }, child : Text('tae'),),
                            ElevatedButton(onPressed : () {
                                playOneYulmyeongNoteDuringDurationTime(
                                    YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
                                    MEDIUM_TEMPO_SEC
                                );
                            }, child : Text('hwang'),),
                            ElevatedButton(onPressed : () {
                                playOneYulmyeongNoteDuringDurationTime(
                                    YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
                                    SLOW_TEMPO_SEC
                                );
                            }, child : Text('moo'),),
                            ElevatedButton(onPressed : () {
                                playOneYulmyeongNoteDuringDurationTime(
                                    YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
                                    SLOW_TEMPO_SEC
                                );
                            }, child : Text('yim'),),
                            ElevatedButton(onPressed : () {
                                playOneYulmyeongNoteDuringDurationTime(
                                    YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
                                    SLOW_TEMPO_SEC
                                );
                            }, child : Text('joong'),),
                            ElevatedButton(onPressed : () {
                                playJungGanBo(testJungGanBo, _flutterMidi);
                            }, child : Text('play'),),
                            ElevatedButton(onPressed : () {
                                endMidi();
                            }, child : Text('stop'),)
                        ],
                    )),
                ),
            );
        }

        void startRecording()async {
            await detector.startRecording();
            if (detector.isRecording) {
                setState(() {
                    isRecording = true;
                });
            }
        }

        void stopRecording()async {
            detector.stopRecording();
            setState(() {
                isRecording = false;
                pitch = detector.pitch;
            });
        }

        void startAdjust()async {
            await detectorAdjust.startRecording();
            if (detectorAdjust.isRecording) {
                setState(() {
                    isAdjust = true;
                });
            }
        }

        void stopAdjust() {
            detector.stopRecording();
            setState(() {
                isAdjust = false;
            });
            pitchModelInterface.settingAdjust(userInputForAdjust);
        }
    }