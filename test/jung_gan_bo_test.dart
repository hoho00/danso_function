import 'dart:io';
import 'package:danso_function/common/classes/JangDan.dart';
import 'package:danso_function/danso_function.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  test('read from txt file', () async {
    var file = await File("assets/늴리리야.txt").readAsLines();
    //print(file.toString());
    for (var i in file) {
      // var splits = i.split('|');
      //print(i.toString()[0]);
      var str = i.toString();
      for (var j = 0; j < i.toString().length; j++) {
        print(str[j]);
      }
    }
  });

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
  });
}
