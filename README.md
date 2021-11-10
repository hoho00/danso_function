# danso_function 🔥🔥🔥

v 2.0.0 is released!!
Applied Null Safety

## Release Note

```
## 2.0.0

- Applied Null Safety

## 1.0.3

- Hot fix!! deleted assets for ios

## 1.0.2

- Hot fix!! deleted assets for ios

## 1.0.1

- Hot fix!! deleted flutterMidi.unmute()

## 1.0.0

- Finally Made all the functions danso application needed 🔥🔥
- But, need some subtle adjustment, so will be updated continuosly

## 0.0.6

- Made playJungGanBo(JungGanBo jungGanBo) function!!
- But Need to adjust

## 0.0.5

- Hot Fix!! Need to change jung gan bo string structure and Accept it!

## 0.0.4

- Completed JungGanBoClass
- Passed all the Test about JungGanBoClass

## 0.0.3

- Made toChineseCharacter and toHangeul in YulmyeongNote class

## 0.0.2

- PitchModelInterface for danso yulmyeong
- Made as Singleton.
- It maps user input frequencies to danso yulmyeong

## 0.0.1

- Initial release
- Sorry for users, this might be a package for private application. So you might not as well use this package. Thanks!

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
2. User에게 기준음을 입력받아서 기준 입출력 frequency에다가 userAdjust를 더해서 사용할 수 있게 한다. `function #2`
3. userWidthFrequency를 정해서 Hit 되는 Frequency의 범위를 정할 수 있게 한다. `function #3`
4. 음이 해당 율명에 맞는지 검사해 주는 기능을 한다. `function #4`
5. 해당 율명의 frequency를 return 하는 기능을 한다. `function #5`
6. 율명 List의 음을 완만하게 평균값을 내 주는 기능을 한다 `function #6`

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

  //function #6
  double getModerateAverageFrequencyByListOfPitches(List<double> pitches) {}
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

  test('getModerateAverageFrequencyByListOfPitches Test' , () {
    List<double> testList = [700.0, 650.0, 1.3, 1680.1, 750.0];
    PitchModelInterface testModel = new PitchModel();
    expect(testModel.getModerateAverageFrequencyByListOfPitches(testList), 700.0);
  });
```

<br>

---

## JungGanBo

This is JungGanBo Class. JungGanBo is made of Jung and Jung is made of YulmyeongNote.
Therefore, JungGanBo has a list member of Jung named sheet, and Jung has a list of Yulmyeong named yulmyeongs. This class also pallerize JungGanBo String Format.

### Abstract

1. Constructor : FlutterMidi() 객체를 미리 생성해 두고 SoundFont도 넣어서 미리 세팅 해 둔다.
2. 해당 정간보의 음을 단소에 장단의 속도에 맞춰서 설정 해 준다. `function#1`
3. 하나의 음을 원하는 시간 만큼 연주해 준다. `function#2`

### Class

```dart
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
    ...
}

class Jung {
  DivisionStatus _divisionStatus;
  List<YulmyeongNote> _yulmyeongs = [];

  DivisionStatus get divisionStatus => _divisionStatus;
  List<YulmyeongNote> get yulmyeongs => _yulmyeongs;

  Jung(String formatString) {
    ...
  }
  ...
}
```

### Usage

- Jung Gan Bo Example Image
  <img src="./jgb_example" width="500px" height="700px" title="example"/>

- Jung Gan Bo string structure

```txt
ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#ht|t|t#t|--h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#y-j|y-m|yj#y-j|y-m|yj|m|m|h#m|--h|mh#ht|t|t#t|h|mh#J|o|YJ#t|--h|m#ht-|t|t#h-t|h-m|yj-#y|mhm|ymy#j|o|^#
```

- Jung Gan Bo Function Usage

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

---

## JungGanBoPlayer

This is JungGanBoPlayer to play JungGanBo Class.

### Abstract

1. Constructor : FlutterMidi() 객체를 미리 생성해 두고 SoundFont도 넣어서 미리 세팅 해 둔다.
2. 해당 정간보의 음을 단소에 장단의 속도에 맞춰서 설정 해 준다. `function#1`
3. 하나의 음을 원하는 시간 만큼 연주해 준다. `function#2`

### Class

```dart
class JungGanBoPlayer {
  FlutterMidi _flutterMidi = FlutterMidi();
  JungGanBo _jungGanBo;

  JungGanBoPlayer() {
    ...
  }
  // function 1
  play(JungGanBo jungGanBo) {
    ...
  }
  // function 2
  playOneNoteDurationTime(YulmyeongNote yulmyeongNote, int durationTime) {
    ...
  }
}
```

## JangDan Class

This is JangDan class.

### Abstract

1. 장단클래스는 enum jangDanType을 가지고 있다.
2. 장단클래스에서 해당 jangDanType에 대한 tempo와 1정에 몇초의 시간이 소요되야 하는 지가 정의 되어 있다.

### Class

```dart
class JangDan {
  JangDan(JangDanType jangDanType) {
    ...
  }

  JangDanType get jangDanType => ...;
  double get tempo => ...;
  int get milliSecond => ...;
  ...
}
```

---

## Additional information

### What is yulmyeong(율명) and danso(단소)

> Yulmyeong is Korean Traditional Notes for music.
> And danso is Korean Traditional instrument.
> more information soon...

### Terms of JungGanBo

> 정간보를 읽는 순서는 위에서 아래로, 오른쪽 줄에서 왼쪽 줄로 읽어나간다. 다만 정간 속의 율명은 왼쪽에서 오른쪽으로 읽은 다음 위에서 아래로 읽는다. 정간보에 쓰이는 용어와 중요한 부호는 다음과 같다.

> - 각 : 오선보의 한 단에 해당하는 것을 ‘각’ 이라 한다.
> - 강 : 오선보의 한마디에 해당하는 것을 ‘강’ 이라 한다.
> - 정 : 오선보의 한 박에 해당하는 것을 ‘정’ 이라 한다.
