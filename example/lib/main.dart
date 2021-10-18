import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pitchdetector/pitchdetector.dart';
import 'package:danso_function/danso_function.dart';
import 'package:enum_to_string/enum_to_string.dart';

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
  bool isRecording = false;
  double pitch;
  String yulmyeong;
  String pitchStatus;
  @override
  void initState() {
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
            FlatButton(
                onPressed: isRecording ? stopRecording : startRecording,
                child: isRecording
                    ? Text("Press Me to stop")
                    : Text("Press Me to run"))
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
}
