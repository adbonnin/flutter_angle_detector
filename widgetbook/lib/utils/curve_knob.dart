import 'package:flutter/widgets.dart';
import 'package:widgetbook/widgetbook.dart';

class CurveKnob extends Knob<Curve?> {
  CurveKnob({
    required super.label,
    required super.initialValue,
    super.description,
  });

  CurveKnob.nullable({
    required super.label,
    required super.initialValue,
    super.description,
  }) : super(isNullable: true);

  @override
  List<Field> get fields {
    return [
      ListField<Curve>(
        name: label,
        initialValue: initialValue,
        labelBuilder: buildLabel,
        values: [
          Curves.linear,
          Curves.decelerate,
          Curves.fastLinearToSlowEaseIn,
          Curves.fastEaseInToSlowEaseOut,
          Curves.ease,
          Curves.easeIn,
          Curves.easeInToLinear,
          Curves.easeInSine,
          Curves.easeInQuad,
          Curves.easeInCubic,
          Curves.easeInQuart,
          Curves.easeInQuint,
          Curves.easeInExpo,
          Curves.easeInCirc,
          Curves.easeInBack,
          Curves.easeOut,
          Curves.linearToEaseOut,
          Curves.easeOutSine,
          Curves.easeOutQuad,
          Curves.easeOutCubic,
          Curves.easeOutQuart,
          Curves.easeOutQuint,
          Curves.easeOutExpo,
          Curves.easeOutCirc,
          Curves.easeOutBack,
          Curves.easeInOut,
          Curves.easeInOutSine,
          Curves.easeInOutQuad,
          Curves.easeInOutCubic,
          Curves.easeInOutCubicEmphasized,
          Curves.easeInOutQuart,
          Curves.easeInOutQuint,
          Curves.easeInOutExpo,
          Curves.easeInOutCirc,
          Curves.easeInOutBack,
          Curves.fastOutSlowIn,
          Curves.slowMiddle,
          Curves.bounceIn,
          Curves.bounceOut,
          Curves.bounceInOut,
          Curves.elasticIn,
          Curves.elasticOut,
          Curves.elasticInOut,
        ],
      ),
    ];
  }

  @override
  Curve? valueFromQueryGroup(Map<String, String> group) {
    return valueOf(label, group);
  }

  String buildLabel(Curve strategy) {
    return switch (strategy) {
      Curves.linear => 'linear',
      Curves.decelerate => 'decelerate',
      Curves.fastLinearToSlowEaseIn => 'fastLinearToSlowEaseIn',
      Curves.fastEaseInToSlowEaseOut => 'fastEaseInToSlowEaseOut',
      Curves.ease => 'ease',
      Curves.easeIn => 'easeIn',
      Curves.easeInToLinear => 'easeInToLinear',
      Curves.easeInSine => 'easeInSine',
      Curves.easeInQuad => 'easeInQuad',
      Curves.easeInCubic => 'easeInCubic',
      Curves.easeInQuart => 'easeInQuart',
      Curves.easeInQuint => 'easeInQuint',
      Curves.easeInExpo => 'easeInExpo',
      Curves.easeInCirc => 'easeInCirc',
      Curves.easeInBack => 'easeInBack',
      Curves.easeOut => 'easeOut',
      Curves.linearToEaseOut => 'linearToEaseOut',
      Curves.easeOutSine => 'easeOutSine',
      Curves.easeOutQuad => 'easeOutQuad',
      Curves.easeOutCubic => 'easeOutCubic',
      Curves.easeOutQuart => 'easeOutQuart',
      Curves.easeOutQuint => 'easeOutQuint',
      Curves.easeOutExpo => 'easeOutExpo',
      Curves.easeOutCirc => 'easeOutCirc',
      Curves.easeOutBack => 'easeOutBack',
      Curves.easeInOut => 'easeInOut',
      Curves.easeInOutSine => 'easeInOutSine',
      Curves.easeInOutQuad => 'easeInOutQuad',
      Curves.easeInOutCubic => 'easeInOutCubic',
      Curves.easeInOutCubicEmphasized => 'easeInOutCubicEmphasized',
      Curves.easeInOutQuart => 'easeInOutQuart',
      Curves.easeInOutQuint => 'easeInOutQuint',
      Curves.easeInOutExpo => 'easeInOutExpo',
      Curves.easeInOutCirc => 'easeInOutCirc',
      Curves.easeInOutBack => 'easeInOutBack',
      Curves.fastOutSlowIn => 'fastOutSlowIn',
      Curves.slowMiddle => 'slowMiddle',
      Curves.bounceIn => 'bounceIn',
      Curves.bounceOut => 'bounceOut',
      Curves.bounceInOut => 'bounceInOut',
      Curves.elasticIn => 'elasticIn',
      Curves.elasticOut => 'elasticOut',
      Curves.elasticInOut => 'elasticInOut',
      _ => '',
    };
  }
}
