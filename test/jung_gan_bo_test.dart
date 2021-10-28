import 'dart:io';
import 'package:test/test.dart';
import 'dart:async';
import 'dart:convert';

void main() {

  test('read from txt file', () async {
    var file = await File("assets/늴리리야.txt").readAsLines();
    print(file.toString());
    
  });
}
