# danso_function ๐ฅ๐ฅ๐ฅ

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

- Finally Made all the functions danso application needed ๐ฅ๐ฅ
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

1. Frequency์ ๋จ์์ ์จ๋ช์ mapping ์์ผ์ค๋ค. `function #1`
2. User์๊ฒ ๊ธฐ์ค์์ ์๋ ฅ๋ฐ์์ ๊ธฐ์ค ์์ถ๋ ฅ frequency์๋ค๊ฐ userAdjust๋ฅผ ๋ํด์ ์ฌ์ฉํ  ์ ์๊ฒ ํ๋ค. `function #2`
3. userWidthFrequency๋ฅผ ์ ํด์ Hit ๋๋ Frequency์ ๋ฒ์๋ฅผ ์ ํ  ์ ์๊ฒ ํ๋ค. `function #3`
4. ์์ด ํด๋น ์จ๋ช์ ๋ง๋์ง ๊ฒ์ฌํด ์ฃผ๋ ๊ธฐ๋ฅ์ ํ๋ค. `function #4`
5. ํด๋น ์จ๋ช์ frequency๋ฅผ return ํ๋ ๊ธฐ๋ฅ์ ํ๋ค. `function #5`
6. ์จ๋ช List์ ์์ ์๋งํ๊ฒ ํ๊ท ๊ฐ์ ๋ด ์ฃผ๋ ๊ธฐ๋ฅ์ ํ๋ค `function #6`

<br>

### InterFace

```dart
class PitchModelInterface {
  //function #1
  YulmyeongNote getYulmyeongByFrequency(double userFrequency) {}

  //function #2
  void settingAdjust(double userInputFrequency) {}

  //function #3
  //PitchConst ์์ const value๋ณ๊ฒฝํด์ ์ ํ๊ธฐ, ui์์๋ ๊ธฐ๋ฅ ์ ๊ณต x

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

1. Constructor : FlutterMidi() ๊ฐ์ฒด๋ฅผ ๋ฏธ๋ฆฌ ์์ฑํด ๋๊ณ  SoundFont๋ ๋ฃ์ด์ ๋ฏธ๋ฆฌ ์ธํ ํด ๋๋ค.
2. ํด๋น ์ ๊ฐ๋ณด์ ์์ ๋จ์์ ์ฅ๋จ์ ์๋์ ๋ง์ถฐ์ ์ค์  ํด ์ค๋ค. `function#1`
3. ํ๋์ ์์ ์ํ๋ ์๊ฐ ๋งํผ ์ฐ์ฃผํด ์ค๋ค. `function#2`

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
    JungGanBo testJungGanBo = new JungGanBo("๋๋ผ์งํ๋ น", "์ธ๋ง์น์ฅ๋จ",
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

1. Constructor : FlutterMidi() ๊ฐ์ฒด๋ฅผ ๋ฏธ๋ฆฌ ์์ฑํด ๋๊ณ  SoundFont๋ ๋ฃ์ด์ ๋ฏธ๋ฆฌ ์ธํ ํด ๋๋ค.
2. ํด๋น ์ ๊ฐ๋ณด์ ์์ ๋จ์์ ์ฅ๋จ์ ์๋์ ๋ง์ถฐ์ ์ค์  ํด ์ค๋ค. `function#1`
3. ํ๋์ ์์ ์ํ๋ ์๊ฐ ๋งํผ ์ฐ์ฃผํด ์ค๋ค. `function#2`

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

1. ์ฅ๋จํด๋์ค๋ enum jangDanType์ ๊ฐ์ง๊ณ  ์๋ค.
2. ์ฅ๋จํด๋์ค์์ ํด๋น jangDanType์ ๋ํ tempo์ 1์ ์ ๋ช์ด์ ์๊ฐ์ด ์์๋์ผ ํ๋ ์ง๊ฐ ์ ์ ๋์ด ์๋ค.

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

### What is yulmyeong(์จ๋ช) and danso(๋จ์)

> Yulmyeong is Korean Traditional Notes for music.
> And danso is Korean Traditional instrument.
> more information soon...

### Terms of JungGanBo

> ์ ๊ฐ๋ณด๋ฅผ ์ฝ๋ ์์๋ ์์์ ์๋๋ก, ์ค๋ฅธ์ชฝ ์ค์์ ์ผ์ชฝ ์ค๋ก ์ฝ์ด๋๊ฐ๋ค. ๋ค๋ง ์ ๊ฐ ์์ ์จ๋ช์ ์ผ์ชฝ์์ ์ค๋ฅธ์ชฝ์ผ๋ก ์ฝ์ ๋ค์ ์์์ ์๋๋ก ์ฝ๋๋ค. ์ ๊ฐ๋ณด์ ์ฐ์ด๋ ์ฉ์ด์ ์ค์ํ ๋ถํธ๋ ๋ค์๊ณผ ๊ฐ๋ค.

> - ๊ฐ : ์ค์ ๋ณด์ ํ ๋จ์ ํด๋นํ๋ ๊ฒ์ โ๊ฐโ ์ด๋ผ ํ๋ค.
> - ๊ฐ : ์ค์ ๋ณด์ ํ๋ง๋์ ํด๋นํ๋ ๊ฒ์ โ๊ฐโ ์ด๋ผ ํ๋ค.
> - ์  : ์ค์ ๋ณด์ ํ ๋ฐ์ ํด๋นํ๋ ๊ฒ์ โ์ โ ์ด๋ผ ํ๋ค.
