import 'package:danso_function/danso_function.dart';

class Jung {
  DivisionStatus _divisionStatus;
  List<YulmyeongNote> _yulmyeongs = [];

  DivisionStatus get divisionStatus => _divisionStatus;
  List<YulmyeongNote> get yulmyeongs => _yulmyeongs;

  Jung(String formatString) {
    if (formatString.length == 1) {
      _divisionStatus = DivisionStatus.one;
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[0]));
    } else if (formatString.length == 2) {
      _divisionStatus = DivisionStatus.two;
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[0]));
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[1]));
    } else if (formatString.length == 3) {
      _divisionStatus = DivisionStatus.three;
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[0]));
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[1]));
      _yulmyeongs.add(getYulmyeongNoteFromFormatString(formatString[2]));
    }
  }

  YulmyeongNote getYulmyeongNoteFromFormatString(String formatString) {
    switch (formatString) {
      case "J":
        return new YulmyeongNote(Yulmyeong.joong, ScaleStatus.high);
        break;

      case "Y":
        return new YulmyeongNote(Yulmyeong.yim, ScaleStatus.high);
        break;

      case "M":
        return new YulmyeongNote(Yulmyeong.moo, ScaleStatus.high);
        break;

      case "H":
        return new YulmyeongNote(Yulmyeong.hwang, ScaleStatus.high);
        break;

      case "T":
        return new YulmyeongNote(Yulmyeong.tae, ScaleStatus.high);
        break;

      case "j":
        return new YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin);
        break;

      case "y":
        return new YulmyeongNote(Yulmyeong.yim, ScaleStatus.origin);
        break;

      case "m":
        return new YulmyeongNote(Yulmyeong.moo, ScaleStatus.origin);
        break;

      case "h":
        return new YulmyeongNote(Yulmyeong.hwang, ScaleStatus.origin);
        break;

      case "t":
        return new YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin);
        break;

      case "o":
        return new YulmyeongNote(Yulmyeong.blank, ScaleStatus.origin);
        break;

      case "-":
        return new YulmyeongNote(Yulmyeong.long, ScaleStatus.origin);
        break;

      case "^":
        return new YulmyeongNote(Yulmyeong.rest, ScaleStatus.origin);
        break;
      default:
        return null;
        break;
    }
  }
}
