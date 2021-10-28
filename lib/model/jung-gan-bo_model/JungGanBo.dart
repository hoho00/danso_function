import 'dart:ffi';

import 'package:danso_function/danso_function.dart';

// 정간보를 읽는 순서는 위에서 아래로, 오른쪽 줄에서 왼쪽 줄로 읽어나간다.
// 다만 정간 속의 율명은 왼쪽에서 오른쪽으로 읽은 다음 위에서 아래로 읽는다.
// 정간보에 쓰이는 용어와 중요한 부호는 다음과 같다.

// 각 : 오선보의 한 단에 해당하는 것을 ‘각’ 이라 한다.
// 강 : 오선보의 한마디에 해당하는 것을 ‘강’ 이라 한다.
// 정 : 오선보의 한 박에 해당하는 것을 ‘정’ 이라 한다.

class JungGanBo implements JungGanBoInterface{
  String _title;
  JangDan _jangDan;
  List<Jung> _sheet;

  String get title => _title;
  JangDan get jangDan => _jangDan;
  List<Jung> get sheet => _sheet;
  //todo
  //make method
}
