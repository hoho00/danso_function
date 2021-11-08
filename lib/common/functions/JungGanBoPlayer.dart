import 'dart:io';

import 'package:danso_function/common/constants/MidiNoteConst.dart';
import 'package:danso_function/danso_function.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter/services.dart'; 
import 'dart:async';

void playJungGanBo(JungGanBo jungGanBo) {
    //playJung(jungGanBo.sheet[0], jungGanBo.jangDan.milliSecond);
    var i = 0;
    //sleep(new Duration(milliseconds: 10));
    Timer.periodic(new Duration(milliseconds: jungGanBo.jangDan.milliSecond), (timer) {
      if (i < jungGanBo.sheet.length) {
        playJung(jungGanBo.sheet[i], jungGanBo.jangDan.milliSecond);
        i++;
      }
      else {
        timer.cancel();
      }   
    });
    allMidiStop();
}

playJung(Jung jung, int durationTime) {
  int halfOfDurationTime = durationTime ~/ 2;
  int oneOfThreeDurationTime = durationTime ~/ 3;
    if (jung.divisionStatus == DivisionStatus.one) {
        if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long && jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
            allMidiStop();
        }
        //sleep(new Duration(milliseconds: 10));
        playOneYulmyeongNote(jung.yulmyeongs[0]);
        return ;
    } else if (jung.divisionStatus == DivisionStatus.two) {
        if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long && jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
            allMidiStop();
        }
        playOneYulmyeongNote(jung.yulmyeongs[0]);
        sleep(new Duration(milliseconds: halfOfDurationTime));

        if (jung.yulmyeongs[1].yulmyeong != Yulmyeong.long  && jung.yulmyeongs[1].yulmyeong != Yulmyeong.blank) {
            allMidiStop();
        }
        //sleep(new Duration(milliseconds: 10));
        playOneYulmyeongNote(jung.yulmyeongs[1]);
        return ;
    } else if (jung.divisionStatus == DivisionStatus.three) {
        if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long  && jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
            allMidiStop();
        }
        playOneYulmyeongNote(jung.yulmyeongs[0]);
        sleep(new Duration(milliseconds: oneOfThreeDurationTime));
        if (jung.yulmyeongs[1].yulmyeong != Yulmyeong.long  && jung.yulmyeongs[1].yulmyeong != Yulmyeong.blank) {
            allMidiStop();
        }
        //sleep(new Duration(milliseconds: 10));
        playOneYulmyeongNote(jung.yulmyeongs[1]);
        sleep(new Duration(milliseconds: oneOfThreeDurationTime));
        if (jung.yulmyeongs[2].yulmyeong != Yulmyeong.long  && jung.yulmyeongs[2].yulmyeong != Yulmyeong.blank) {
            allMidiStop();
        }
        //sleep(new Duration(milliseconds: 10));
        playOneYulmyeongNote(jung.yulmyeongs[2]);
        return ;
    }

}

playOneYulmyeongNoteDuringDurationTime(
    YulmyeongNote yulmyeongNote,
    int durationTime
) {
    final player = FlutterMidi();
    int notePlayed = getMidiNoteFromYulmyeongNote(yulmyeongNote);
    player.playMidiNote(midi : notePlayed);

    Timer(new Duration(milliseconds : durationTime), () {
        player.stopMidiNote(midi : notePlayed);
    });
}

playOneYulmyeongNote(YulmyeongNote yulmyeongNote) {
    final player = FlutterMidi();
    int notePlayed = getMidiNoteFromYulmyeongNote(yulmyeongNote);
    player.playMidiNote(midi : notePlayed);
}

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
            default: //high:
        }
    } else {
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


allMidiStop() {
    final stopPlayer = FlutterMidi();
    for (var i = 0; i < 128; i++) {
        stopPlayer.stopMidiNote(midi : i);
    }
}

endMidi() {
    final stopPlayer = FlutterMidi();
    for (var i = 0; i < 128; i++) {
        stopPlayer.stopMidiNote(midi : i);
    }
}

loadSF2(String asset, FlutterMidi flutterMidi) async {
    print( 'Loading File...');
    //flutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);
    flutterMidi.prepare(sf2 : _byte, name :  "Dan.sf2");
}