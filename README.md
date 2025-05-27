# Angle detector

A Flutter widget that calculates the angle (in radians) between its center and the user's touch
position.

You can check out a live demo using Widgetbook [here](https://adbonnin.github.io/flutter_angle_detector).

[![Pub](https://img.shields.io/pub/v/angle_detector.svg)](https://pub.dartlang.org/packages/angle_detector)

## Getting started

Add the package to your project by importing it:

```dart
import 'package:angle_detector/angle_detector.dart';
```

Wrap your widget with `AngleDetector` and define the `onAngleChanged` callback. This callback is
triggered whenever the user touches the screen, and it provides the angle (in radians) between the
center of the widget and the touch position.

In the example below, the detected angle is used inside a `Transform.rotate` widget to visually
indicate the direction of the user’s interaction.

```dart
class AngleDetectorExample extends StatefulWidget {
  const AngleDetectorExample({super.key});

  @override
  State<AngleDetectorExample> createState() => _AngleDetectorExampleState();
}

class _AngleDetectorExampleState extends State<MyHomePage> {
  var _angle = 0.0;

  @override
  Widget build(BuildContext context) {
    return AngleDetector(
      onAngleChanged: _onAngleChanged,
      child: Transform.rotate(
        angle: _angle,
        child: Center(
          child: Icon(Icons.arrow_upward),
        ),
      ),
    );
  }

  void _onAngleChanged(double angle) {
    setState(() => _angle = angle);
  }
}
```

The `AngleAnimatedRotation` widget is also available.
It wraps an `AnimatedRotation`, but instead of requiring turns, it takes an angle in radians and automatically converts it.

These angles follow the same convention as `Transform.rotate`, making them fully compatible with the values provided by `AngleDetector`.

```dart
AngleDetector(
  onAngleChanged: _onAngleChanged,
  child: AngleAnimatedRotation(
    angle: _angle,
    child: Center(
      child: Icon(Icons.arrow_upward),
    ),
  ),
)
```

## Use Cases

- Gesture-based rotation
- Directional UI feedback
- Game controls or interactive components
