# danso_function 🔥🔥🔥


## Release Note
```
## 0.0.1
* Initial release
* Sorry for users, this might be a package for private application. So you might not as well use this package. Thanks!


## 0.0.2
* PitchModelInterface for danso yulmyeong
* Made as Singleton.
* It maps user input frequencies to danso yulmyeong

## 0.0.3
* Made toChineseCharacter and toHangeul in YulmyeongNote class


## 0.0.4
* Completed JungGanBoClass
* Passed all the Test about JungGanBoClass

## 0.0.5
* Hot Fix!! Need to change jung gan bo string structure and Accept it!
```
<br>

## Getting started
```markdown 
    flutter pub add danso_function
```
<br>

---

## Features

### PitchModel Interface

This is PitchModelInterface. PitchModelInterface class is an interface and PitchModel is concrete Model. So you can use PitchModelInterface to use functions which I made. Here are functions I made. 
<br>

### Abstract

1. Frequency와 단소의 율명을 mapping 시켜준다. `function #1`
2. User에게 기준음을 입력받아서 기준 입출력 frequency에다가 userAdjust를 더해서 사용할 수 있게 한다.  `function #2`
3. userWidthFrequency를 정해서 Hit 되는 Frequency의 범위를 정할 수 있게 한다. `function #3`
4. 음이 해당 율명에 맞는지 검사해 주는 기능을 한다. `function #4`
5. 해당 율명의 frequency를 return 하는 기능을 한다. `function #5`

<br>

### InterFace

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
<br>

### Usage

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
<br>

---

## JungGanBo Interface

This is JungGanBo Interface.


### Abstract

1. inprogress

### InterFace

```dart
  inprogress ....

```

### Usage

* Jung Gan Bo Example Image
<img src="./jgb_example" width="500px" height="700px" title="example"/>


* Jung Gan Bo string structure
```txt
ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#ht|t|t#t|--h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#y-j|y-m|yj#y-j|y-m|yj|m|m|h#m|--h|mh#ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#
```
* Jung Gan Bo Function Usage
```dart
  void playJungGanBo() async {
    JungGanBo testJungGanBo = new JungGanBo("도라지타령", "세마치장단",
        "ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#ht|t|t#t|--h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#y-j|y-m|yj#y-j|y-m|yj|m|m|h#m|--h|mh#ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#");

    testJungGanBo.sheet[0].yulmyeongs[0];
    for (var i = 0; i < testJungGanBo.sheet.length; i++) {
      for (var j = 0; j < testJungGanBo.sheet[i].yulmyeongs.length; j++) {
        // To do what you can do with YulmyeonNote
        print(testJungGanBo.sheet[i].yulmyeongs[j].toHangeul());
      }
    }
  }
```

## Additional information

### What is yulmyeong(율명) and danso(단소)

>Yulmyeong is Korean Traditional Notes for music.
>And danso is Korean Traditional instrument.
>more information soon...

### Terms of JungGanBo
  >정간보를 읽는 순서는 위에서 아래로, 오른쪽 줄에서 왼쪽 줄로 읽어나간다. 다만 정간 속의 율명은 왼쪽에서 오른쪽으로 읽은 다음 위에서 아래로 읽는다. 정간보에 쓰이는 용어와 중요한 부호는 다음과 같다.

 >- 각 : 오선보의 한 단에 해당하는 것을 ‘각’ 이라 한다.
 >- 강 : 오선보의 한마디에 해당하는 것을 ‘강’ 이라 한다.
 >- 정 : 오선보의 한 박에 해당하는 것을 ‘정’ 이라 한다.


