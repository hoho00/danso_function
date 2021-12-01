import 'dart:typed_data';

import 'package:danso_function/danso_function.dart';
import 'package:danso_function/model/jung-gan-bo_model/JungGanBo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';
import 'package:pitchupdart/instrument_type.dart';
import 'package:pitchupdart/pitch_handler.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _flutterMidi = FlutterMidi();
  final _audioRecorder = FlutterAudioCapture();
  final pitchDetectorDart = PitchDetector(44100, 2000);
  final pitchupDart = PitchHandler(InstrumentType.guitar);
  var result1;
  var note = "";
  var status = "Click on start";
  String _value = 'assets/Dan.sf2';
  final _player = AudioPlayer(handleInterruptions: false);
  late AudioSession audioSessions;
  JungGanBo testJungGanBo = new JungGanBo(
            "도라지타령",
            "자진모리장단",
            "ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#ht|t|t#t|--h|" +
                    "mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#y-j|y-m|yj#y-j|y-m|yj|m|" +
                    "m|h#m|--h|mh#ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#"
        );

  JungGanBoPlayer jungGanBoPlayer = JungGanBoPlayer();
  iosAudioSession() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
            avAudioSessionCategoryOptions:
                AVAudioSessionCategoryOptions.defaultToSpeaker,
            avAudioSessionMode: AVAudioSessionMode.videoRecording,
            avAudioSessionRouteSharingPolicy:
                AVAudioSessionRouteSharingPolicy.defaultPolicy,
            avAudioSessionSetActiveOptions:
                AVAudioSessionSetActiveOptions.notifyOthersOnDeactivation,
    )).then((_) => audioSessions = session);
  }

  @override
  void initState() {
    super.initState();
    load(_value);
    //iosAudioSession();
  }

  void load(String asset) async {
    print('Loading File...');
    _flutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);
    //assets/sf2/SmallTimGM6mb.sf2
    //assets/sf2/Piano.SF2
    _flutterMidi.prepare(sf2: _byte, name: _value.replaceAll('assets/', ''));
  }

  Future<void> _startCapture() async {
    await _audioRecorder.start(listener, onError,
        sampleRate: 44100, bufferSize: 3000);

    setState(() {
      note = "";
      status = "Play something";
    });
  }

  Future<void> _stopCapture() async {
    await _audioRecorder.stop();

    setState(() {
      note = "";
      status = "Click on start";
    });
  }

  void listener(dynamic obj) {
    //Gets the audio sample
    var buffer = Float64List.fromList(obj.cast<double>());
    final List<double> audioSample = buffer.toList();

    //Uses pitch_detector_dart library to detect a pitch from the audio sample
    final result = pitchDetectorDart.getPitch(audioSample);

    //If there is a pitch - evaluate it
    if (result.pitched) {
      //Uses the pitchupDart library to check a given pitch for a Guitar
      final handledPitchResult = pitchupDart.handlePitch(result.pitch);

      //Updates the state with the result
      setState(() {
        result1 = result.pitch;
        note = handledPitchResult.note;
        status = handledPitchResult.tuningStatus.toString();
      });
    }
  }

  void onError(Object e) {
    print(e);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          Center(
              child: Text(
            note,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          )),
          Center(
              child: Text(
            '$result1',
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          )),
          const Spacer(),
          Center(
            child: ElevatedButton(
              child: Text('Play C'),
              onPressed: () {
                jungGanBoPlayer.play(testJungGanBo);
              },
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              // await iosAudioSession();
              _player.setAsset('assets/semachi.wav');
              _flutterMidi.playMidiNote(midi: 60);

              // _player.setVolume(100.0);
              _player.setSpeed(0.8);
              _player.play();
            },
            child: Text('Cow'),
          ),
          Center(
              child: Text(
            status,
            style: const TextStyle(
                color: Colors.black87,
                fontSize: 14.0,
                fontWeight: FontWeight.bold),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: Center(
                      child: FloatingActionButton(
                          onPressed: () async {
                            _startCapture();
                            iosAudioSession();
                            },
                          child: const Text("Start")))),
              Expanded(
                  child: Center(
                      child: FloatingActionButton(
                          onPressed: _stopCapture, child: const Text("Stop")))),
            ],
          ))
        ]),
      ),
    );
  }
}
