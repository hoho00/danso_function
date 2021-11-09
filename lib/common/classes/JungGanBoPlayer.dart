import 'package:danso_function/danso_function.dart';
import 'package:flutter_midi/flutter_midi.dart';
import '../functions/JungGanBoPlayer.dart';

class JungGanBoPlayer {
  FlutterMidi _flutterMidi = FlutterMidi();
  JungGanBo _jungGanBo;

  JungGanBoPlayer() {
    //loadSF2("assets/Dan.sf2", _flutterMidi);
  }
  play(JungGanBo jungGanBo) {
    for (var i = 0; i < jungGanBo.sheet.length; i++) {
      for (var j = 0; j < jungGanBo.sheet[i].yulmyeongs.length; j++) {
        print(i.toString() + " " + j.toString() + " " + jungGanBo.sheet[i].yulmyeongs[j].toHangeul());
      }
    }
    playJungGanBo(jungGanBo);
  }

  playOneNoteDurationTime(YulmyeongNote yulmyeongNote, int durationTime) {
    playOneYulmyeongNoteDuringDurationTime(yulmyeongNote, durationTime);
  }

  endMidi() {
    for (var i = 0; i < 128; i++) {
      _flutterMidi.stopMidiNote(midi: i);
    }
  }
}