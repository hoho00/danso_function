import 'dart:math';

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
    expect(hyup, 392.00);
  });

  test('Pitch Model getFrequencyByYulmyeong joong', () {
    PitchModel pitchModel = new PitchModel();

    var joong =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.joong, ScaleStatus.origin);
    expect(joong, 440.00);
  });

  test('Pitch Model getFrequencyByYulmyeong yim', () {
    PitchModel pitchModel = new PitchModel();
    var yim =
        pitchModel.getFrequencyByYulmyeong(Yulmyeong.yim, ScaleStatus.origin);
    expect(yim, 493.88);
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
        Yulmyeong.tae, pitchModel.getYulmyeongByFrequency(STANDARD_PITCH + 10));
  });

  test('Pitch Model getYulmyeongByFrequency hyup', () {
    PitchModel pitchModel = new PitchModel();
    expect(
        pitchModel.getYulmyeongByFrequency(STANDARD_PITCH + 30), Yulmyeong.hyup);
  });

  test('Pitch Model getYulmyeongByFrequency tae high', () {
    PitchModel pitchModel = new PitchModel();
    expect(
        pitchModel.getYulmyeongByFrequency(1479.98 + 11), Yulmyeong.tae);
  });
}
