//장단 enum과 빠르기 정의 해 놓아야 함

import 'package:danso_function/danso_function.dart';

class JangDan {
  JangDanType _jangDanType;
  double _tempo;
  int _milliSecond;

  JangDan(JangDanType jangDanType) {
    _jangDanType = jangDanType;
    _tempo = getTempo(jangDanType);
    _milliSecond = getMilliSecond(jangDanType);
  }

  JangDanType get jangDanType => _jangDanType;
  double get tempo => _tempo;
  int get milliSecond => _milliSecond;


  void setJangDanType(JangDanType jangDanType) {
    _jangDanType = jangDanType;
  }

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

  int getMilliSecond(JangDanType jangDanType) {
    int ms = 0;
    switch (jangDanType) {
      case JangDanType.semachi:
        ms = MEDIUM_TEMPO_SEC;
        break;

      case JangDanType.goodGeori:
        ms = MEDIUM_TEMPO_SEC;
        break;

      case JangDanType.joongJoongMori:
        ms = SLOW_TEMPO_SEC;
        break;

      case JangDanType.jajinMori:
        ms = FAST_TEMPO_SEC;
        break;

      case JangDanType.huiMori:
        ms = FAST_TEMPO_SEC;
        break;
      default:
    }
    return ms;
  }
  @override
  bool operator ==(covariant JangDan other) {
    return (this._jangDanType == other.jangDanType &&
        this._tempo == other.tempo);
  }
}
