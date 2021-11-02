import 'package:danso_function/common/constants/MidiNoteConst.dart';
import 'package:danso_function/danso_function.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'dart:async';

void playJungGanBo(JungGanBo jungGanBo) {
  int i = 1;
  //jungGanBo.jangDan
  playJung(jungGanBo.sheet[0]);
  interval(new Duration(milliseconds: 900), (timer) {
    if (i < jungGanBo.sheet.length) {
      playJung(jungGanBo.sheet[i]);
      i++;
    } else {
      timer.cancel();
      return;
    }
  });
}

playJung(
  Jung jung,
) {
  if (jung.divisionStatus == DivisionStatus.one) {
    playOneYulmyeongNote(jung.yulmyeongs[0], 900);
  } else if (jung.divisionStatus == DivisionStatus.two) {
    playOneYulmyeongNote(jung.yulmyeongs[0], 450);
    int i = 1;
    interval(new Duration(milliseconds: 450), (timer) {
      if (i < 2) {
        playOneYulmyeongNote(jung.yulmyeongs[i], 450);
        i++;
      } else {
        timer.cancel();
        return;
      }
    });
  } else if (jung.divisionStatus == DivisionStatus.three) {
    playOneYulmyeongNote(jung.yulmyeongs[0], 300);
    int i = 1;
    interval(new Duration(milliseconds: 300), (timer) {
      if (i < 3) {
        playOneYulmyeongNote(jung.yulmyeongs[i], 300);
        i++;
      } else {
        timer.cancel();
        return;
      }
    });
  }
}

playOneYulmyeongNote(YulmyeongNote yulmyeongNote, int millisec) {
  final player = FlutterMidi();
  int notePlayed = getMidiNoteFromYulmyeongNote(yulmyeongNote);
  player.playMidiNote(midi: notePlayed);
  Timer(new Duration(milliseconds: millisec - 10), () {
    player.stopMidiNote(midi: notePlayed);
  });
}

makePlaySheet() {}

int getMidiNoteFromYulmyeongNote(YulmyeongNote yulmyeongNote) {
  int res = 0;
  if (yulmyeongNote.scaleStatus == ScaleStatus.origin) {
    switch (yulmyeongNote.yulmyeong) {
      case Yulmyeong.joong:
        res = JOONG_NOTE;
        break;
      case Yulmyeong.yim:
        res = YIM_NOTE;
        break;
      case Yulmyeong.moo:
        res = MOO_NOTE;
        break;
      case Yulmyeong.hwang:
        res = HWANG_NOTE;
        break;
      case Yulmyeong.tae:
        res = TAE_NOTE;
        break;
      case Yulmyeong.blank:
        res = REST_NOTE;
        break;
      case Yulmyeong.rest:
        res = REST_NOTE;
        break;
      default:
    }
  }
  //high
  else {
    switch (yulmyeongNote.yulmyeong) {
      case Yulmyeong.joong:
        res = JOONG_HIGH_NOTE;
        break;
      case Yulmyeong.yim:
        res = YIM_HIGH_NOTE;
        break;
      case Yulmyeong.moo:
        res = MOO_HIGH_NOTE;
        break;
      case Yulmyeong.hwang:
        res = HWANG_HIGH_NOTE;
        break;
      case Yulmyeong.tae:
        res = TAE_HIGH_NOTE;
        break;
      case Yulmyeong.blank:
        res = REST_NOTE;
        break;
      case Yulmyeong.rest:
        res = REST_NOTE;
        break;
      default:
    }
  }
  return res;
}

Timer interval(Duration duration, func) {
  Timer function() {
    Timer timer = new Timer(duration, function);

    func(timer);

    return timer;
  }

  return new Timer(duration, function);
}
