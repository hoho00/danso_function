Release v0.0.2

## Features

# PitchModel Interface

This is PitchModelInterface. PitchModelInterface class is an interface and PitchModel is concrete Model. So you can use PitchModelInterface to use functions which I made. Here are functions I made. 

# The Basics

## Abstract

1. Frequency와 단소의 율명을 mapping 시켜준다. `function #1`
2. User에게 기준음을 입력받아서 기준 입출력 frequency에다가 userAdjust를 더해서 사용할 수 있게 한다.  `function #2`
3. userWidthFrequency를 정해서 Hit 되는 Frequency의 범위를 정할 수 있게 한다. `function #3`
4. 음이 해당 율명에 맞는지 검사해 주는 기능을 한다. `function #4`
5. 해당 율명의 frequency를 return 하는 기능을 한다. `function #5`

## InterFace

```dart
class PitchModelInterface {
  //function #1
  YulmyeongNote getYulmyeongByFrequency(double userFrequency) {}
  
  //function #2
  void settingAdjust(double userInputFrequency) {}

  //function #3
  //PitchConst 에서 const value변경해서 정하기, ui에서는 기능 제공 x

  //function #4
  bool isCorrectPitch(double userFrequency, YulmyeongNote detectPitch) {}

  //function #5
  double getFrequencyByYulmyeongNote(YulmyeongNote outPutPitch) {}
}
```

## Getting started
```markdown
    flutter pub add danso_function
```
## Usage

```dart
  test('Pitch Model getYulmyeongByFrequency tae high', () {
    PitchModel pitchModel = new PitchModel();
    expect(
        pitchModel.getYulmyeongByFrequency(1479.98 + 11) ==
            YulmyeongNote(Yulmyeong.tae, ScaleStatus.high),
        true);
  });

  test('Pitch Model isCorrectPitch', () {
    PitchModel pitchModel = new PitchModel();
    expect(
        pitchModel.isCorrectPitch(
            STANDARD_PITCH, YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin)),
        true);
  });

  test('Pitch Model isCorrectPitch', () {
    PitchModel pitchModel = new PitchModel();
    expect(
        pitchModel.isCorrectPitch(
            STANDARD_PITCH, YulmyeongNote(Yulmyeong.tae, ScaleStatus.high)),
        false);
  });

  test('Singleton test', () {
    PitchModelInterface pitchModel = new PitchModel();
    PitchModelInterface pitchModel2 = new PitchModel();

    //PitchModel pitchModel3 = new PitchModel();
    pitchModel.settingAdjust(760.11);

    expect(
        pitchModel2.isCorrectPitch(
            760.11, new YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin)),
        true);

  });
```

## Additional information

### What is yulmyeong(율명) and danso(단소)

Yulmyeong is Korean Traditional Notes for music.
And danso is Korean Traditional instrument.
more information soon...
