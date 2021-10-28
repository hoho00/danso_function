//장단 enum과 빠르기 정의 해 놓아야 함

import 'package:danso_function/danso_function.dart';

class JangDan {
  double getTempo(JangDanType jangDanType) {
    double tempo = 0.0;
    switch (jangDanType) {
      case JangDanType.semachi:
        tempo = MEDIUM_TEMPO;
        break;

      case JangDanType.goodGeori:
        tempo = MEDIUM_TEMPO;
        break;

      case JangDanType.joongJoongMori:
        tempo = SLOW_TEMPO;
        break;

      case JangDanType.jajinMori:
        tempo = FAST_TEMPO;
        break;

      case JangDanType.huiMori:
        tempo = FAST_TEMPO;
        break;
      default:
    }
    return tempo;
  }
}
