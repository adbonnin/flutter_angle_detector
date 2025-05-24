import 'package:angle_detector/src/angle_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class AngleDetector extends StatelessWidget {
  const AngleDetector({
    super.key,
    required this.onAngleChanged,
    this.behavior = HitTestBehavior.translucent,
    this.excludeFromSemantics = false,
    this.supportedDevices,
    required this.child,
  });

  final ValueChanged<double> onAngleChanged;
  final HitTestBehavior? behavior;
  final bool excludeFromSemantics;
  final Set<PointerDeviceKind>? supportedDevices;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final maxWidth = constraints.maxWidth;
        final maxHeight = constraints.maxHeight;

        if (maxWidth.isInfinite || maxHeight.isInfinite || maxWidth <= 0 || maxHeight <= 0) {
          return child ?? const SizedBox.shrink();
        }

        final center = Offset(maxWidth / 2, maxHeight / 2);

        return GestureDetector(
          onPanDown: (details) => _handleTouch(center, details.localPosition),
          onPanUpdate: (details) => _handleTouch(center, details.localPosition),
          behavior: behavior,
          excludeFromSemantics: excludeFromSemantics,
          supportedDevices: supportedDevices,
          child: child,
        );
      },
    );
  }

  void _handleTouch(Offset center, Offset localPosition) {
    final angle = calculateAngle(center, localPosition);
    onAngleChanged(angle);
  }
}
