import 'package:angle_detector/angle_detector.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
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
    return AngleDetector(
      onAngleChanged: _onAngleChanged,
      child: AngleAnimatedRotation(
        angle: _angle,
        duration: const Duration(milliseconds: 300),
        curve: Curves.elasticOut,
        child: const SizedBox.expand(
          child: DirectionIndicator(),
        ),
      ),
    );
  }

  void _onAngleChanged(double angle) {
    setState(() => _angle = angle);
  }
}
