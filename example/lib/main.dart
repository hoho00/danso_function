
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:pitchdetector/pitchdetector.dart';
import 'package:danso_function/danso_function.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:dart_midi/dart_midi.dart';
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
    String _value = 'assets/Dan.sf2';
    Timer _timer;
    JungGanBoPlayer jungGanBoPlayer;

    var parser = MidiParser();
    JungGanBo testJungGanBo = new JungGanBo(
        "늴리리야",
        "굿거리장단",
        "YY-|JYJ|t#YY-|JYJ|t#YY-|JYJ|tht#J|--o|Y-J#tt-|h-m|ym#tt-|h-J|t-h#m|mhm|y-j#y|--m|y#y-j|y-m|y#y-j|y-m|y#YY-|JYJ|tht#J|--o|Y-J#tt-|h-m|ym-#tt-|h-J|t-h#m|mhm|y-j#y|--m|y#"
    );
    @override void initState() {
        //load(_value);
        jungGanBoPlayer = new JungGanBoPlayer();
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
                                jungGanBoPlayer.playOneNoteDurationTime(
                                    YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
                                    2000
                                );
                                // playOneYulmyeongNoteDuringDurationTime(     YulmyeongNote(Yulmyeong.tae,
                                // ScaleStatus.origin),     FAST_TEMPO_SEC );
                            }, child : Text('tae'),),
                            ElevatedButton(onPressed : () {
                                jungGanBoPlayer.playOneNoteDurationTime(
                                    YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
                                    2000
                                );
                                // playOneYulmyeongNoteDuringDurationTime(     YulmyeongNote(Yulmyeong.hwang,
                                // ScaleStatus.origin),     FAST_TEMPO_SEC );
                            }, child : Text('hwang'),),
                            ElevatedButton(onPressed : () {
                                jungGanBoPlayer.playOneNoteDurationTime(
                                    YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
                                    2000
                                );
                                // playOneYulmyeongNoteDuringDurationTime(     YulmyeongNote(Yulmyeong.moo,
                                // ScaleStatus.origin),     MEDIUM_TEMPO_SEC );
                            }, child : Text('moo'),),
                            ElevatedButton(onPressed : () {
                                jungGanBoPlayer.playOneNoteDurationTime(
                                    YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
                                    2000
                                );
                                // playOneYulmyeongNoteDuringDurationTime(     YulmyeongNote(Yulmyeong.yim,
                                // ScaleStatus.origin),     SLOW_TEMPO_SEC );
                            }, child : Text('yim'),),
                            ElevatedButton(onPressed : () {
                                jungGanBoPlayer.playOneNoteDurationTime(
                                    YulmyeongNote(Yulmyeong.joong, ScaleStatus.high),
                                    2000
                                );
                                // playOneYulmyeongNoteDuringDurationTime(     YulmyeongNote(Yulmyeong.joong,
                                // ScaleStatus.origin),     SLOW_TEMPO_SEC );
                            }, child : Text('joong high'),),
                            ElevatedButton(onPressed : () {
                                jungGanBoPlayer.play(testJungGanBo);
                            }, child : Text('play'),),
                            ElevatedButton(onPressed : () {
                                //todo
                                //endMidi();
                                jungGanBoPlayer.endMidi();
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