import 'package:angle_detector/angle_detector.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook_workspace/utils/widget_book.dart';
import 'package:widgetbook_workspace/widgets/direction_indicator.dart';

@widgetbook.UseCase(
  name: 'Angle Detector',
  type: AngleDetector,
)
Widget buildAngleDetectorUseCase(BuildContext context) {
  return AngleDetectorUseCase();
}

class AngleDetectorUseCase extends StatefulWidget {
  const AngleDetectorUseCase({super.key});

  @override
  State<AngleDetectorUseCase> createState() => _AngleDetectorUseCaseState();
}

class _AngleDetectorUseCaseState extends State<AngleDetectorUseCase> {
  var _angle = 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(8),
      child: Material(
        color: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: AngleDetector(
          onAngleChanged: _onAngleChanged,
          child: AngleAnimatedRotation(
            angle: _angle,
            curve: context.knobs.animationCurve(),
            duration: context.knobs.animationDuration(),
            child: SizedBox.expand(
              child: DirectionIndicator(
                color: theme.colorScheme.inversePrimary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onAngleChanged(double angle) {
    setState(() => _angle = angle);
  }
}
