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
}
