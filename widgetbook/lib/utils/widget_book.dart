import 'package:flutter/animation.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_workspace/utils/curve_knob.dart';

extension KnobsBuilderExtension on KnobsBuilder {
  Curve animationCurve() {
    return onKnobAdded(
      CurveKnob(
        label: 'animation curve',
        initialValue: Curves.linear,
      ),
    )!;
  }

  Duration animationDuration() {
    return duration(
      label: 'animation duration',
      initialValue: Duration(milliseconds: 200),
    );
  }
}
