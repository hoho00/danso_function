import 'dart:collection';
import '../common/pitch_const/PitchConst.dart';

class PitchModel {
  Map<Yulmyeong, double> _yulmyeongFrequency;
  double _standardFrequency = STANDARD_PITCH;
  double _userAdjustedPitchFrequency = 0;
  double _correctRange = STANDARD_CORRECT_RANGE;

  PitchModel() {
    double adjustFrequency = _standardFrequency + _userAdjustedPitchFrequency;
    _yulmyeongFrequency = calculateYulmyeong(adjustFrequency);
  }

  Yulmyeong getYulmyeongByFrequency(double userFrequency) {
    Yulmyeong resultYulmyeong;
    ScaleStatus resultScaleStatus;
    _yulmyeongFrequency.forEach((yulmyeong, frequency) {
      List originRange =
          getFrequencyRangeByYulmyeong(yulmyeong, ScaleStatus.origin);
      List highRange =
          getFrequencyRangeByYulmyeong(yulmyeong, ScaleStatus.high);
      if (originRange[0] <= userFrequency && userFrequency <= originRange[1]) {
        resultYulmyeong = yulmyeong;
        resultScaleStatus = ScaleStatus.origin;
      }
      if (highRange[0] <= userFrequency && userFrequency <= highRange[1]) {
        resultYulmyeong = yulmyeong;
        resultScaleStatus = ScaleStatus.high;
      }
    });
    return resultYulmyeong;
  }

  double getFrequencyByYulmyeong(Yulmyeong yulmyeong, ScaleStatus scaleStatus) {
    double resultYulmyeong = 0.0;
    switch (scaleStatus) {
      case ScaleStatus.origin:
        resultYulmyeong = _yulmyeongFrequency[yulmyeong];
        break;
      case ScaleStatus.high:
        resultYulmyeong = _yulmyeongFrequency[yulmyeong] * SCALEUP_CONSTANT;
        break;
      default:
        resultYulmyeong = -1.0;
        break;
    }
    return resultYulmyeong;
  }

  //List[0] = low, List[1] = high
  List getFrequencyRangeByYulmyeong(
      Yulmyeong yulmyeong, ScaleStatus scaleStatus) {
    List correctRange = [
      getFrequencyByYulmyeong(yulmyeong, scaleStatus) - _correctRange,
      getFrequencyByYulmyeong(yulmyeong, scaleStatus) + _correctRange
    ];
    return correctRange;
  }

  bool isCorrectPitch(
      Yulmyeong yulmyeong, double userFrequency, ScaleStatus scaleStatus) {
    // Map<Yulmyeong, ScaleStatus> decision =
    //     getYulmyeongByFrequency(userFrequency);
  }

  Map<Yulmyeong, double> calculateYulmyeong(double standardFrequency) {
    double tae = standardFrequency;
    double hwang = tae * LAMBDA_MULTIFLIER_WHOLETONE;
    double moo = hwang * LAMBDA_MULTIFLIER_WHOLETONE;
    double nam = moo * LAMBDA_MULTIFLIER_SEMITONE;
    double yim = nam * LAMBDA_MULTIFLIER_WHOLETONE;
    double joong = yim * LAMBDA_MULTIFLIER_WHOLETONE;
    double hyup = joong * LAMBDA_MULTIFLIER_WHOLETONE;
    var yulmyeongFrequency = {
      Yulmyeong.hyup: double.parse(hyup.toStringAsFixed(2)),
      Yulmyeong.joong: double.parse(joong.toStringAsFixed(2)),
      Yulmyeong.yim: double.parse(yim.toStringAsFixed(2)),
      Yulmyeong.nam: double.parse(nam.toStringAsFixed(2)),
      Yulmyeong.moo: double.parse(moo.toStringAsFixed(2)),
      Yulmyeong.hwang: double.parse(hwang.toStringAsFixed(2)),
      Yulmyeong.tae: double.parse(tae.toStringAsFixed(2))
    };
    return yulmyeongFrequency;
  }
}
