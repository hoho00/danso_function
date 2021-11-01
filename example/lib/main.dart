import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
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
  @override
  _MyAppState createState() => _MyAppState();
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



  var parser = MidiParser();
  @override
  void initState() {
    load(_value);
    super.initState();
    
    detector = new Pitchdetector(sampleRate: 44100, sampleSize: 4096);
    isRecording = isRecording;
    detector.onRecorderStateChanged.listen((event) {
      setState(() {
        pitch = event["pitch"];
        yulmyeong = EnumToString.convertToString(
            pitchModelInterface.getYulmyeongByFrequency(pitch).yulmyeong);
        pitchStatus = EnumToString.convertToString(
            pitchModelInterface.getYulmyeongByFrequency(pitch).scaleStatus);
      });
    });
    detectorAdjust = new Pitchdetector(sampleRate: 44100, sampleSize: 4096);
    detectorAdjust.onRecorderStateChanged.listen((event) {
      setState(() {
        userInputForAdjust = event["pitch"];
      });
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void load(String asset) async {
    print('Loading File...');
    _flutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);
    //assets/sf2/SmallTimGM6mb.sf2
    //assets/sf2/Piano.SF2
    _flutterMidi.prepare(sf2: _byte, name: "hi");
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            isRecording ? Text("Recording...") : Container(),
            isRecording
                ? Text(
                    "Recorded hz from mic is : $pitch and yulmyeong is : $yulmyeong and pitchStatus : $pitchStatus")
                : Text("Not Recording."),
            TextButton(
                onPressed: isRecording ? stopRecording : startRecording,
                child: isRecording
                    ? Text("Press Me to stop")
                    : Text("Press Me to run")),
            isAdjust
                ? Text("Adjusting... Please play tae")
                : Text("Current Standard $userInputForAdjust"),
            isAdjust
                ? Text("Recorded hz from mic is : $userInputForAdjust")
                : Text("Not Adjusting"),
            TextButton(
                onPressed: isAdjust ? stopAdjust : startAdjust,
                child: isAdjust
                    ? Text("Prees me to stop adjusting")
                    : Text("Press me to adjust")),
            ElevatedButton(
              onPressed: () async {
                // TODO: cow button
                await _player.setAsset('assets/semachi.wav');
                _player.play();
              },
              child: Text('Cow'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                _player.stop();
                // TODO: horse button
              },
              child: Text('Horse'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                _flutterMidi.playMidiNote(midi: 60);              
              },
              child: Text('joong'),
            ),
          ],
        )),
      ),
    );
  }

  void startRecording() async {
    await detector.startRecording();
    if (detector.isRecording) {
      setState(() {
        isRecording = true;
      });
    }
  }

  void stopRecording() async {
    detector.stopRecording();
    setState(() {
      isRecording = false;
      pitch = detector.pitch;
    });
  }

  void startAdjust() async {
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
