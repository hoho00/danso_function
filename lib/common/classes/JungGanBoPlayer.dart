import 'package:danso_function/danso_function.dart';
import 'package:flutter_midi/flutter_midi.dart';

class JungGanBoPlayer {
  FlutterMidi _flutterMidi;
  JungGanBo _jungGanBo;

  JungGanBoPlayer(JungGanBo jungGanBo, FlutterMidi flutterMidi) {
    _jungGanBo = jungGanBo;
    _flutterMidi = flutterMidi;
  }
}