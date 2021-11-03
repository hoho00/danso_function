//To change Client's requirement

import 'dart:ffi';
import '../classes/YulmyeongNote.dart';

const F_FREQ = 698.46;
const F_SHARP_FREQ = 739.99;
const double LAMBDA_MULTIFLIER_WHOLETONE =
    0.8908987181403313407142545261283171935;
const double LAMBDA_MULTIFLIER_SEMITONE = 0.9438743126816892778461134;
//const LAMBDA_MULTIFLIER_CUBIC = 0.855261504650115966796875;

const STANDARD_PITCH = F_FREQ;
const STANDARD_CORRECT_RANGE = 20.0;
const SCALEUP_CONSTANT = 2;

enum Yulmyeong { hyup, joong, yim, nam, moo, hwang, tae, rest, long, blank, start}
enum ScaleStatus { origin, high }
