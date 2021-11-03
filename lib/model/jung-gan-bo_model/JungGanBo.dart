import 'package:danso_function/danso_function.dart';

// 정간보를 읽는 순서는 위에서 아래로, 오른쪽 줄에서 왼쪽 줄로 읽어나간다. 다만 정간 속의 율명은 왼쪽에서 오른쪽으로 읽은 다음 위에서
// 아래로 읽는다. 정간보에 쓰이는 용어와 중요한 부호는 다음과 같다. 각 : 오선보의 한 단에 해당하는 것을 ‘각’ 이라 한다. 강 :
// 오선보의 한마디에 해당하는 것을 ‘강’ 이라 한다. 정 : 오선보의 한 박에 해당하는 것을 ‘정’ 이라 한다.

class JungGanBo implements JungGanBoInterface {
    String _title;
    JangDan _jangDan;
    List<Jung> _sheet = [];

    String get title => _title;
    JangDan get jangDan => _jangDan;
    List<Jung> get sheet => _sheet;
    //todo make method

    JungGanBo(String title, String jangDan, String formatString) {
        _title = title;
        setJangDanString(jangDan);
        setJungGanBoSheetFromFormatString(formatString);
    }

    void setJungGanBoSheetFromFormatString(String formatString) {
        String tmp = "";
        for (var i = 0; i < formatString.length; i++) {
            if (formatString[i] == "|") {
                print(tmp);
                _sheet.add(new Jung(tmp));
                tmp = "";
            } else if (formatString[i] == "#") {
                print(tmp);
                _sheet.add(new Jung(tmp));
                tmp = "";
            } else {
                tmp += formatString[i];
            }
        }
    }

    //set jangDang(JangDan jangDan) => _jangDan = jangDan;
    set title(String title) => _title = title;

    void setJangDanString(String jangDan) {
        JangDanType tmp;
        switch (jangDan) {
            case "세마치장단":
                tmp = JangDanType.semachi;
                break;

            case "중중모리장단":
                tmp = JangDanType.joongJoongMori;
                break;

            case "자진모리장단":
                tmp = JangDanType.jajinMori;
                break;

            case "휘모리장단":
                tmp = JangDanType.huiMori;
                break;

            case "굿거리장단":
                tmp = JangDanType.goodGeori;
                break;

            case "4박장단":
                tmp = JangDanType.fourByFour;
                break;

            default:
                break;
        }
        _jangDan = JangDan(tmp);
    }
}
