import 'package:angle_detector/src/angle_utils.dart';
import 'package:flutter/widgets.dart';

class AngleAnimatedRotation extends StatefulWidget {
  const AngleAnimatedRotation({
    super.key,
    required this.angle,
    this.alignment = Alignment.center,
    this.filterQuality,
    this.curve = Curves.linear,
    required this.duration,
    this.child,
  });

  final double angle;
  final Alignment alignment;
  final FilterQuality? filterQuality;
  final Curve curve;
  final Duration duration;
  final Widget? child;

  @override
  State<AngleAnimatedRotation> createState() => _AngleAnimatedRotationState();
}

class _AngleAnimatedRotationState extends State<AngleAnimatedRotation> {
  late double _turns;

  @override
  void initState() {
    super.initState();
    _turns = calculateTurns(widget.angle);
  }

  @override
  void didUpdateWidget(covariant AngleAnimatedRotation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.angle != widget.angle) {
      setState(() {
        _turns = calculateTurns(widget.angle, _turns);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: _turns,
      alignment: widget.alignment,
      filterQuality: widget.filterQuality,
      curve: widget.curve,
      duration: widget.duration,
      child: widget.child,
    );
  }
}
