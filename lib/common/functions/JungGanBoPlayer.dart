import 'package:danso_function/common/constants/MidiNoteConst.dart';
import 'package:danso_function/danso_function.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:flutter/services.dart'; 
import 'dart:async';

playJungGanBo(JungGanBo jungGanBo) {
    int i = 1;
<<<<<<< HEAD
    // String soundFontPath = "assests/Dan.sf2";
    // load(soundFontPath, flutterMidi);
    int milliSecondInOneJung = jungGanBo.jangDan.milliSecond;
    playJung(jungGanBo.sheet[0], milliSecondInOneJung);
    interval(new Duration(milliseconds : milliSecondInOneJung), (timer) {
=======
    String soundFontPath = "assests/Dan.sf2";
    load(soundFontPath, FlutterMidi());
    playJung(jungGanBo.sheet[0]);
    interval(new Duration(milliseconds : FAST_TEMPO_SEC), (timer) {
>>>>>>> parent of db8b1de (Fix : Fixed JungGanBoPlayer to play in tempo via jangdan)
        if(i < jungGanBo.sheet.length) {
            playJung(jungGanBo.sheet[i]);
            i++;
        } else {
            timer.cancel();
            return;
        }
    });
}

playJung(Jung jung) {
    if (jung.divisionStatus == DivisionStatus.one) {
        if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long && jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
            allMidiStop();
        }
        playOneYulmyeongNote(jung.yulmyeongs[0]);
        return jung.yulmyeongs[0];
    } else if (jung.divisionStatus == DivisionStatus.two) {
        if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long && jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
            allMidiStop();
        }
        playOneYulmyeongNote(jung.yulmyeongs[0]);
        int i = 1;
        interval(
            new Duration(milliseconds : FAST_TEMPO_SEC ~/2), (timer) {
            if(i < 2) {
                if (jung.yulmyeongs[i].yulmyeong != Yulmyeong.long  && jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
                    allMidiStop();
                }
                playOneYulmyeongNote(jung.yulmyeongs[i]);
                i++;
            } else {
                timer.cancel();
                return jung.yulmyeongs[1];
            }
        });
        return jung.yulmyeongs[1];
    } else if (jung.divisionStatus == DivisionStatus.three) {
        if (jung.yulmyeongs[0].yulmyeong != Yulmyeong.long  && jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
            allMidiStop();
        }
        playOneYulmyeongNote(jung.yulmyeongs[0]);
        int i = 1;
        interval(new Duration(milliseconds : FAST_TEMPO_SEC ~/3),
            (timer) {
                if(i < 3) {
                    if (jung.yulmyeongs[i].yulmyeong != Yulmyeong.long && jung.yulmyeongs[0].yulmyeong != Yulmyeong.blank) {
                        allMidiStop();
                    }
                    playOneYulmyeongNote(jung.yulmyeongs[i]);
                    i++;
                } else {
                    timer.cancel();
                    return jung.yulmyeongs[2];
                }
            }
        );
        return jung.yulmyeongs[2];
    }

}

<<<<<<< HEAD
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

=======
>>>>>>> parent of db8b1de (Fix : Fixed JungGanBoPlayer to play in tempo via jangdan)
playOneYulmyeongNote(YulmyeongNote yulmyeongNote) {
    final player = FlutterMidi();
    int notePlayed = getMidiNoteFromYulmyeongNote(yulmyeongNote);
    player.playMidiNote(midi : notePlayed);
}

YulmyeongNote playOneYulmyeonNoteWithPrev(
    YulmyeongNote yulmyeongNote,
    int millisec,
    YulmyeongNote prevYulmyeongNote
) {
    final player = FlutterMidi();
    int notePlayed = getMidiNoteFromYulmyeongNote(yulmyeongNote);
    if (yulmyeongNote.yulmyeong != Yulmyeong.long) {
        allMidiStop();
    }
    player.playMidiNote(midi : notePlayed);
    return yulmyeongNote;
}

playOneYulmyeongNoteNonStop(YulmyeongNote yulmyeongNote) {
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

Timer interval(Duration duration, func) {
    Timer function () {
        Timer timer = new Timer(duration, function);
        func(timer);
        return timer;
    }
    return new Timer(duration, function);
}

allMidiStop() {
    final stopPlayer = FlutterMidi();
    for (var i = 50; i < 128; i++) {
        stopPlayer.stopMidiNote(midi : i);
    }
}

endMidi() {
    final stopPlayer = FlutterMidi();
    for (var i = 0; i < 128; i++) {
        stopPlayer.stopMidiNote(midi : i);
    }
}

load(String asset, FlutterMidi flutterMidi) async {
    print( 'Loading File...');
    flutterMidi.unmute();
    ByteData _byte = await rootBundle.load(asset);
    flutterMidi.prepare(sf2 : _byte, name :  "hi");
}