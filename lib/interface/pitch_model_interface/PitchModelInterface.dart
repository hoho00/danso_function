import 'package:danso_function/danso_function.dart';

/**
 * 1. Frequency와 단소의 율명을 mapping 시켜준다. `function #1`
 * 2. User에게 기준음을 입력받아서 기준 입출력 frequency에다가 userAdjust를 더해서 사용할 수 있게 한다.  `function #2`
 * 3. userRangeFrequency를 정해서 Hit 되는 Frequency의 범위를 정할 수 있게 한다. `function #3`
 * 4. 음이 해당 율명에 맞는지 검사해 주는 기능을 한다. `function #4`
 * 5. 해당 율명의 frequency를 return 하는 기능을 한다. `function #5`
 */

//this is
class PitchModelInterface {
  //function #1
  YulmyeongNote? getYulmyeongByFrequency(double userFrequency) {}
  
  //function #2
  void settingAdjust(double userInputFrequency) {}

  //function #3
  //PitchConst 에서 const value변경해서 정하기, ui에서는 기능 제공 x

  //function #4
  bool? isCorrectPitch(double userFrequency, YulmyeongNote detectPitch) {}

  //function #5
  double? getFrequencyByYulmyeongNote(YulmyeongNote outPutPitch) {}

  //function #6
  double? getModerateAverageFrequencyByListOfPitches(List<double> pitches) {}
}
