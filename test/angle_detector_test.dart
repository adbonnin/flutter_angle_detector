import 'dart:math' as math;

import 'package:angle_detector/src/angle_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('normalizeTurns', () {
    test('should normalize in range [0, 1) for positive input', () {
      expect(normalizeTurns(0.0), 0.0);
      expect(normalizeTurns(0.25), 0.25);
      expect(normalizeTurns(1.0), 0.0);
      expect(normalizeTurns(1.75), closeTo(0.75, 1e-10));
    });

    test('should normalize in range [0, 1) for negative input', () {
      expect(normalizeTurns(-0.25), closeTo(0.75, 1e-10));
      expect(normalizeTurns(-1.25), closeTo(0.75, 1e-10));
    });
  });

  group('calculateTurns', () {
    test('should calculates delta turns without currentTurns', () {
      expect(calculateTurns(0.0), closeTo(0.0, 1e-10));

      expect(calculateTurns(math.pi), closeTo(-0.5, 1e-10));
      expect(calculateTurns(2 * math.pi), closeTo(0.0, 1e-10));
      expect(calculateTurns(3 * math.pi), closeTo(-0.5, 1e-10));

      expect(calculateTurns(math.pi / 2), closeTo(0.25, 1e-10));
      expect(calculateTurns(-math.pi / 2), closeTo(-0.25, 1e-10));
    });

    test('should calculates delta turns with currentTurns', () {
      expect(calculateTurns(math.pi, 1.0), closeTo(0.5, 1e-10));
      expect(calculateTurns(math.pi / 2, 1.0), closeTo(1.25, 1e-10));
      expect(calculateTurns(-math.pi / 2, 1.0), closeTo(0.75, 1e-10));
    });

    test('should wraps properly across multiple revolutions', () {
      expect(calculateTurns(5 * math.pi, 0.0), closeTo(-0.5, 1e-10));
      expect(calculateTurns(-3 * math.pi, 0.0), closeTo(-0.5, 1e-10));
    });
  });

  group('calculateAngle', () {
    test('should calculates angle in radians with center at origin', () {
      const center = Offset(0, 0);

      expect(calculateAngle(center, const Offset(0, 1)), closeTo(0.0, 1e-10)); // Top
      expect(calculateAngle(center, const Offset(1, 0)), closeTo(3 * math.pi / 2, 1e-10)); // Right
      expect(calculateAngle(center, const Offset(0, -1)), closeTo(math.pi, 1e-10)); // Bottom
      expect(calculateAngle(center, const Offset(-1, 0)), closeTo(math.pi / 2, 1e-10)); // Left
    });

    test('should calculates angle in radians with non-zero center', () {
      const center = Offset(2, 2);

      expect(calculateAngle(center, const Offset(2, 3)), closeTo(0.0, 1e-10));
      expect(calculateAngle(center, const Offset(3, 2)), closeTo(3 * math.pi / 2, 1e-10));
      expect(calculateAngle(center, const Offset(2, 1)), closeTo(math.pi, 1e-10));
      expect(calculateAngle(center, const Offset(1, 2)), closeTo(math.pi / 2, 1e-10));
    });
  });
}
