import 'dart:math' as math;

import 'package:flutter/gestures.dart';

double normalizeTurns(double turns) => (turns % 1 + 1) % 1;

double calculateTurns(double angle, [double currentTurns = 0.0]) {
  final oldTurns = normalizeTurns(currentTurns);
  final newTurns = normalizeTurns(angle / (2 * math.pi));

  final delta = ((newTurns - oldTurns + 1.5) % 1.0) - 0.5;
  return currentTurns + delta;
}

double calculateAngle(Offset center, Offset localPosition) {
  final dx = localPosition.dx - center.dx;
  final dy = localPosition.dy - center.dy;

  return (math.atan2(-dx, dy) + 2 * math.pi) % (2 * math.pi);
}
