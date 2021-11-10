import 'dart:math';

import 'package:danso_function/interface/pitch_model_interface/PitchModelInterface.dart';
import 'package:flutter/foundation.dart';
import 'package:test/test.dart';
import 'package:danso_function/danso_function.dart';

void main() {
  test('danso function test start!!!', () {
    var string = 'foo,bar,baz';
    expect(string.split(','), equals(['foo', 'bar', 'baz']));
  });

  test('Pitch Model getFrequencyByYulmyeong hyup', () {
    PitchModel pitchModel = new PitchModel();
    var hyup =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.hyup, ScaleStatus.origin);
    expect(hyup, 370.00);
  });

  test('Pitch Model getFrequencyByYulmyeong joong', () {
    PitchModel pitchModel = new PitchModel();

    var joong =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.joong, ScaleStatus.origin);
    expect(joong, 415.31);
  });

  test('Pitch Model getFrequencyByYulmyeong yim', () {
    PitchModel pitchModel = new PitchModel();
    var yim =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.yim, ScaleStatus.origin);
    expect(yim, 466.17);
  });

  // Yulmyeong "nam" is deprecated
  // test('Pitch Model getFrequencyByYulmyeong nam', () {
  //   PitchModel pitchModel = new PitchModel();
  //   var nam =
  //       pitchModel.getFrequencyByYulmyeong(Yulmyeong.nam, ScaleStatus.origin);
  //   expect(nam, 554.37);
  // });

  test('Pitch Model getFrequencyByYulmyeong moo', () {
    PitchModel pitchModel = new PitchModel();
    var moo =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.moo, ScaleStatus.origin);
    expect(moo, 554.37);
  });
  test('Pitch Model getFrequencyByYulmyeong hwang', () {
    PitchModel pitchModel = new PitchModel();
    var hwang =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.hwang, ScaleStatus.origin);
    expect(hwang, 622.26);
  });

  test('Pitch Model getFrequencyByYulmyeong tae', () {
    PitchModel pitchModel = new PitchModel();
    var tae =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.tae, ScaleStatus.origin);
    expect(tae, 698.46);
  });

  test('Pitch Model getFrequencyByYulmyeong hyup high', () {
    PitchModel pitchModel = new PitchModel();
    var hyup =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.hyup, ScaleStatus.high);
    expect(hyup, 740.0);
  });

  test('Pitch Model getFrequencyByYulmyeong joong high', () {
    PitchModel pitchModel = new PitchModel();

    var joong =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.joong, ScaleStatus.high);
    expect(joong, 830.62);
  });

  test('Pitch Model getFrequencyByYulmyeong yim high', () {
    PitchModel pitchModel = new PitchModel();
    var yim =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.yim, ScaleStatus.high);
    expect(yim, 932.34);
  });

  // Yulmyeong nam is deprecated
  // test('Pitch Model getFrequencyByYulmyeong nam high', () {
  //   PitchModel pitchModel = new PitchModel();
  //   var nam =
  //       pitchModel.getFrequencyByYulmyeong(Yulmyeong.nam, ScaleStatus.high);
  //   expect(nam, 1108.74);
  // });

  test('Pitch Model getFrequencyByYulmyeong moo high', () {
    PitchModel pitchModel = new PitchModel();
    var moo =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.moo, ScaleStatus.high);
    expect(moo, 1108.74);
  });
  test('Pitch Model getFrequencyByYulmyeong hwang high', () {
    PitchModel pitchModel = new PitchModel();
    var hwang =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.hwang, ScaleStatus.high);
    expect(hwang, 1244.52);
  });

  test('Pitch Model getFrequencyByYulmyeong tae high', () {
    PitchModel pitchModel = new PitchModel();
    var tae =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.tae, ScaleStatus.high);
    expect(tae, 1396.92);
  });

  test('Pitch Model getYulmyeongByFrequency tae', () {
    PitchModel pitchModel = new PitchModel();
    expect(
        pitchModel.getYulmyeongByFrequency(STANDARD_PITCH + 10) ==
            YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin),
        true);
  });

  test('Pitch Model getYulmyeongByFrequency hyup', () {
    PitchModel pitchModel = new PitchModel();
    expect(
        pitchModel.getYulmyeongByFrequency(STANDARD_PITCH + 30) ==
            YulmyeongNote(Yulmyeong.hyup, ScaleStatus.high),
        true);
  });

  test('Pitch Model getYulmyeongByFrequency tae high', () {
    PitchModel pitchModel = new PitchModel();
    expect(
        pitchModel.getYulmyeongByFrequency(STANDARD_PITCH * 2 + 11) ==
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
    pitchModel.settingAdjust(F_SHARP_FREQ + 10.11);

    expect(
        pitchModel2.isCorrectPitch(
            F_SHARP_FREQ, new YulmyeongNote(Yulmyeong.tae, ScaleStatus.origin)),
        true);
  });

  test('Chinese Character Transformation Test', () {
    expect(
        YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin).toChineseCharacter(),
        "仲");
  });

  test('Hanguel Character Transformation Test', () {
    expect(
        YulmyeongNote(Yulmyeong.joong, ScaleStatus.origin).toHangeul(),
        "중");
  });

  test('getModerateAverageFrequencyByListOfPitches Test' , () {
    List<double> testList = [700.0, 650.0, 1.3, 1680.1, 750.0];
    PitchModelInterface testModel = new PitchModel();
    expect(testModel.getModerateAverageFrequencyByListOfPitches(testList), 700.0);
  });
}
