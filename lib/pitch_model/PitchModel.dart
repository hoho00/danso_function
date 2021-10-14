import 'dart:collection';
import '../common/pitch_const/PitchConst.dart';

enum Yulmyeong { joong, yim, moo, hwang, tae }

class PitchModel {
  Map<String, int> _yulmyeongFrequency;
  double _standardFrequency = F_SHARP_FREQ;
  double _userAdjustedPitchFrequency = 0;
  int _scaleStatus = 0;

  PitchModel(double ) {
    _yulmyeongFrequency ={
      'joong': ,
      'yim' : ,
      'moo' : ,
      'hwang' : , 
    };
  }
}
