import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meeting_voting/resources/resources.dart';
import 'package:meeting_voting/src/core/color_system.dart';

class MHCheckBox extends FormField<bool> {
  MHCheckBox.small({
    super.key,
    required bool checked,
    required VoidCallback onTap,
    super.validator,
  }) : super(
          builder: (state) => build(
            state,
            checked: checked,
            onTap: onTap,
            size: 16,
            padding: 3,
          ),
        );

  MHCheckBox.medium({
    super.key,
    required bool checked,
    required VoidCallback onTap,
    super.validator,
  }) : super(
          builder: (state) => build(
            state,
            checked: checked,
            onTap: onTap,
            size: 24,
            padding: 6,
          ),
        );

  MHCheckBox.large({
    super.key,
    required bool checked,
    required VoidCallback onTap,
    super.validator,
  }) : super(
          builder: (state) => build(
            state,
            checked: checked,
            onTap: onTap,
            size: 32,
            padding: 8,
          ),
        );

  static Widget build(FormFieldState<bool?> state, {required bool checked, required VoidCallback onTap, required double size, required double padding}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: switch (checked) {
              true => colorSystem.highlight.darkest,
              false when state.hasError => colorSystem.support.error.medium,
              _ => colorSystem.neutral.light.darkest,
            },
            width: 1.5,
          ),
          color: switch (checked) {
            true => colorSystem.highlight.darkest,
            _ => Colors.white,
          },
        ),
        child: SvgPicture.asset(
          Svgs.check,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
