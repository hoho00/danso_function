import 'dart:ffi';
import 'dart:html';

import 'package:danso_function/danso_function.dart';

import '../pitch_const/PitchConst.dart';

class YulmyeongNote {
  Yulmyeong _yulmyeong;
  ScaleStatus _scaleStatus;

  YulmyeongNote(y, s) {
    _yulmyeong = y;
    _scaleStatus = s;
  }

  Yulmyeong get yulmyeong {
    return _yulmyeong;
  }

  ScaleStatus get scaleStatus {
    return _scaleStatus;
  }

  @override
  bool operator ==(covariant YulmyeongNote other) {
    return (this._yulmyeong == other._yulmyeong &&
        this._scaleStatus == other._scaleStatus);
  }

  String toChineseCharacter() {
    String res = "invalid";
    //origin
    if (_scaleStatus == ScaleStatus.origin) {
      switch (_yulmyeong) {
        case Yulmyeong.hyup:
          res = "夾";
          break;
        case Yulmyeong.joong:
          res = "仲";
          break;
        case Yulmyeong.yim:
          res = "林";
          break;
        case Yulmyeong.nam:
          res = "南";
          break;
        case Yulmyeong.moo:
          res = "無";
          break;
        case Yulmyeong.hwang:
          res = "潢";
          break;
        case Yulmyeong.tae:
          res = "汰";
          break;
        case Yulmyeong.rest:
          res = "△";
          break;
        case Yulmyeong.long:
          res = "-";
          break;
        default:
      }
    }
    //high
    else {
      switch (_yulmyeong) {
        case Yulmyeong.hyup:
          res = "夾";
          break;
        case Yulmyeong.joong:
          res = "㳞";
          break;
        case Yulmyeong.yim:
          res = "淋";
          break;
        case Yulmyeong.nam:
          res = "湳";
          break;
        case Yulmyeong.moo:
          res = "潕";
          break;
        case Yulmyeong.hwang:
          res = "㶂";
          break;
        case Yulmyeong.tae:
          res = "㳲";
          break;
        case Yulmyeong.rest:
          res = "△";
          break;
        case Yulmyeong.long:
          res = "-";
          break;
        default:
      }
    }
    return res;
  }

  String toHangeul() {
    String res = "invalid";
    //origin
    if (_scaleStatus == ScaleStatus.origin) {
      switch (_yulmyeong) {
        case Yulmyeong.hyup:
          res = "협";
          break;
        case Yulmyeong.joong:
          res = "중";
          break;
        case Yulmyeong.yim:
          res = "임";
          break;
        case Yulmyeong.nam:
          res = "남";
          break;
        case Yulmyeong.moo:
          res = "무";
          break;
        case Yulmyeong.hwang:
          res = "황";
          break;
        case Yulmyeong.tae:
          res = "태";
          break;
        case Yulmyeong.rest:
          res = "△";
          break;
        case Yulmyeong.long:
          res = "-";
          break;
        default:
      }
    }
    //high
    else {
      switch (_yulmyeong) {
        case Yulmyeong.hyup:
          res = "높은 협";
          break;
        case Yulmyeong.joong:
          res = "높은 중";
          break;
        case Yulmyeong.yim:
          res = "높은 임";
          break;
        case Yulmyeong.nam:
          res = "높은 남";
          break;
        case Yulmyeong.moo:
          res = "높은 무";
          break;
        case Yulmyeong.hwang:
          res = "높은 황";
          break;
        case Yulmyeong.tae:
          res = "높은 태";
          break;
        case Yulmyeong.rest:
          res = "△";
          break;
        case Yulmyeong.long:
          res = "-";
          break;
        default:
      }
    }
    return res;
  }
}
