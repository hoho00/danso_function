import 'dart:math';

import 'package:danso_function/interface/pitch_model_interface/PitchModelInterface.dart';
import 'package:flutter/foundation.dart';
import 'package:pitchdetector/pitchdetector.dart';
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

  test('Pitch Model getFrequencyByYulmyeong nam', () {
    PitchModel pitchModel = new PitchModel();
    var nam =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.nam, ScaleStatus.origin);
    expect(nam, 554.37);
  });

  test('Pitch Model getFrequencyByYulmyeong moo', () {
    PitchModel pitchModel = new PitchModel();
    var moo =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.moo, ScaleStatus.origin);
    expect(moo, 587.33);
  });
  test('Pitch Model getFrequencyByYulmyeong hwang', () {
    PitchModel pitchModel = new PitchModel();
    var hwang =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.hwang, ScaleStatus.origin);
    expect(hwang, 659.26);
  });

  test('Pitch Model getFrequencyByYulmyeong tae', () {
    PitchModel pitchModel = new PitchModel();
    var tae =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.tae, ScaleStatus.origin);
    expect(tae, 739.99);
  });

  test('Pitch Model getFrequencyByYulmyeong hyup high', () {
    PitchModel pitchModel = new PitchModel();
    var hyup =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.hyup, ScaleStatus.high);
    expect(hyup, 784.00);
  });

  test('Pitch Model getFrequencyByYulmyeong joong high', () {
    PitchModel pitchModel = new PitchModel();

    var joong =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.joong, ScaleStatus.high);
    expect(joong, 880.00);
  });

  test('Pitch Model getFrequencyByYulmyeong yim high', () {
    PitchModel pitchModel = new PitchModel();
    var yim =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.yim, ScaleStatus.high);
    expect(yim, 987.76);
  });

  test('Pitch Model getFrequencyByYulmyeong nam high', () {
    PitchModel pitchModel = new PitchModel();
    var nam =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.nam, ScaleStatus.high);
    expect(nam, 1108.74);
  });

  test('Pitch Model getFrequencyByYulmyeong moo high', () {
    PitchModel pitchModel = new PitchModel();
    var moo =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.moo, ScaleStatus.high);
    expect(moo, 1174.66);
  });
  test('Pitch Model getFrequencyByYulmyeong hwang high', () {
    PitchModel pitchModel = new PitchModel();
    var hwang =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.hwang, ScaleStatus.high);
    expect(hwang, 1318.52);
  });

  test('Pitch Model getFrequencyByYulmyeong tae high', () {
    PitchModel pitchModel = new PitchModel();
    var tae =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.tae, ScaleStatus.high);
    expect(tae, 1479.98);
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
}
