import 'package:danso_function/common/classes/JangDan.dart';
import 'package:danso_function/danso_function.dart';
import 'package:test/test.dart';

void main() {
    test('Jangdan getTempo function test', () {
        JangDan jangDan = new JangDan(JangDanType.jajinMori);
        expect(jangDan.getTempo(JangDanType.jajinMori), FAST_TEMPO);
    });

    test(
        'JungGanBoInterface Test@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@' +
                '@@@@@@@@@@@@@@@@@',
        () {
            expect(true, true);
        }
    );

    test('generateJungGanBoSheetFromFormatString test', ()async {
        JungGanBo testJungGanBo = new JungGanBo(
            "도라지타령",
            "세마치장단",
            "ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#ht|t|t#t|--h|" +
                    "mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#y-j|y-m|yj#y-j|y-m|yj|m|" +
                    "m|h#m|--h|mh#ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#"
        );
        // testJungGanBo.setJungGanBoSheetFromFormatString("ht/t/t|t/h/mh|J/o/YJ|t/--h
        // /m|ht-/t/t|h-t/h-m/yj-|y/mhm/ymy|j/o/^|ht/t/t|t/--h/mh|J/o/YJ|t/--h/m|ht-/t
        // /t|h-t/h-m/yj-|y/mhm/ymy|j/o/^|y-j/y-m/yj|y-j/y-m/yj/m/m/h|m/--h/mh|ht/t/t|
        // t/h/mh|J/o/YJ|t/--h/m|ht-/t/t|h-t/h-m/yj-|y/mhm/ymy|j/o/^|"); print(t);
        // print(testJungGanBo);

        expect(testJungGanBo.title, "도라지타령");
        expect(testJungGanBo.jangDan, JangDan(JangDanType.semachi));
    });

    test('test Yulmyeong == ', () {
        expect(
            YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin) == YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
            true
        );
    });

    JungGanBo testJungGanBo = new JungGanBo(
        "title",
        "세마치장단",
        "jym|htJ|YMH#T^-|joo|jo-#"
    );

    List<YulmyeongNote> actual = [
        YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.joong, ScaleStatus.high),
        YulmyeongNote(Yulmyeong.yim, ScaleStatus.high),
        YulmyeongNote(Yulmyeong.moo, ScaleStatus.high),
        YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high),
        YulmyeongNote(Yulmyeong.tae, ScaleStatus.high),
        YulmyeongNote(Yulmyeong.rest, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.long, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.blank, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.blank, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.blank, ScaleStatus.origin),
        YulmyeongNote(Yulmyeong.long, ScaleStatus.origin)
    ];

    test('makeJungGanBo test1', () {
        for(var i = 0; i < testJungGanBo.sheet[0].yulmyeongs.length; i++) {
            expect(testJungGanBo.sheet[0].yulmyeongs[i], actual[i]);
        }
    });

    test('makeJungGanBo test2', () {
        for(var i = 0; i < testJungGanBo.sheet[1].yulmyeongs.length; i++) {
            expect(testJungGanBo.sheet[1].yulmyeongs[i], actual[3 + i]);
        }
    });

    test('makeJungGanBo test3', () {
        for(var i = 0; i < testJungGanBo.sheet[2].yulmyeongs.length; i++) {
            expect(testJungGanBo.sheet[2].yulmyeongs[i], actual[6 + i]);
        }
    });

    test('makeJungGanBo test4', () {
        for(var i = 0; i < testJungGanBo.sheet[3].yulmyeongs.length; i++) {
            expect(testJungGanBo.sheet[3].yulmyeongs[i], actual[9 + i]);
        }
    });

    test('makeJungGanBo test5', () {
        for(var i = 0; i < testJungGanBo.sheet[4].yulmyeongs.length; i++) {
            expect(testJungGanBo.sheet[4].yulmyeongs[i], actual[12 + i]);
        }
    });

    test('makeJungGanBo test5', () {
        for(var i = 0; i < testJungGanBo.sheet[5].yulmyeongs.length; i++) {
            expect(testJungGanBo.sheet[5].yulmyeongs[i], actual[15 + i]);
        }
    });
}
