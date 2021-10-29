import 'dart:io';
import 'package:danso_function/common/classes/JangDan.dart';
import 'package:danso_function/danso_function.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  test('Jangdan getTempo function test', () {
    JangDan jangDan = new JangDan();
    expect(jangDan.getTempo(JangDanType.jajinMori), FAST_TEMPO);
  });

  test(
      'JungGanBoInterface Test@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@',
      () {
    expect(true, true);
  });

  test('generateJungGanBoSheetFromTextFile test', () async {
    JungGanBoInterface testJungGanBo = JungGanBo();
    var t = await testJungGanBo.getJungGanBoSheetFromTextFile("assets/남생이.txt");
    //print(t);
    expect(true, true);
  });
}
