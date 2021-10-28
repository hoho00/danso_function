import 'dart:io';
import 'package:danso_function/common/classes/JangDan.dart';
import 'package:danso_function/danso_function.dart';
import 'package:test/test.dart';
import 'dart:async';
import 'dart:convert';

void main() {
  test('read from txt file', () async {
    var file = await File("assets/늴리리야.txt").readAsLines();
    print(file.toString());
  });

  test('Jangdan getTempo function test', () {
    JangDan jangDan = new JangDan();
    expect(jangDan.getTempo(JangDanType.jajinMori), FAST_TEMPO);
  });
}
