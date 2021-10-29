import 'package:danso_function/danso_function.dart';

class Jung {
  DivisionStatus _divisionStatus;
  List<YulmyeongNote> _yulmyeongs;

  DivisionStatus get divisionStatus => _divisionStatus;
  List<YulmyeongNote> get yulmyeongs => _yulmyeongs;

  Jung(String formatString) {
    if (formatString.length == 1) {
      _divisionStatus = DivisionStatus.one;
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString));
    } else if (formatString.length == 2) {
      _divisionStatus = DivisionStatus.two;
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[0]));
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[1]));
    } else {
      _divisionStatus = DivisionStatus.three;
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[0]));
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[1]));
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[2]));
    }
  }

  YulmyeongNote getYulmyeongNoteFromFormatString(String formatString) {
    YulmyeongNote res;
    switch (formatString) {
      case "J":
        res = YulmyeongNote(Yulmyeong.joong, ScaleStatus.high);
        break;

      case "Y":
        res = YulmyeongNote(Yulmyeong.yim, ScaleStatus.high);
        break;

      case "M":
        res = YulmyeongNote(Yulmyeong.moo, ScaleStatus.high);
        break;

      case "H":
        res = YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high);
        break;

      case "T":
        res = YulmyeongNote(Yulmyeong.tae, ScaleStatus.high);
        break;

      case "j":
        res = YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin);
        break;

      case "y":
        res = YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin);
        break;

      case "m":
        res = YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin);
        break;

      case "h":
        res = YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin);
        break;

      case "t":
        res = YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin);
        break;

      case "o":
        res = YulmyeongNote(Yulmyeong.blank, ScaleStatus.origin);
        break;

      case "-":
        res = YulmyeongNote(Yulmyeong.long, ScaleStatus.origin);
        break;

      case "^":
        res = YulmyeongNote(Yulmyeong.rest, ScaleStatus.origin);
        break;
      default:
    }
    return res;
  }
}
