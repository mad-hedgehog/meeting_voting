import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meeting_voting/src/core/color_system.dart';
import 'package:meeting_voting/src/core/extension/context_extension.dart';
import 'package:meeting_voting/src/core/text_system.dart';

part 'button_primary.dart';
part 'button_secondary.dart';
part 'button_tertiary.dart';

enum ButtonType { primary, secondary, tertiary }

class Button extends StatefulWidget {
  Button.primary({
    super.key,
    required this.child,
    required this.onTap,
    this.textStyle,
    this.expand = false,
    this.height,
  }) {
    type = ButtonType.primary;
  }

  Button.secondary({
    super.key,
    required this.child,
    required this.onTap,
    this.textStyle,
    this.expand = false,
    this.height,
  }) {
    type = ButtonType.secondary;
  }

  Button.tertiary({
    super.key,
    required this.child,
    required this.onTap,
    this.textStyle,
    this.expand = false,
    this.height,
  }) {
    type = ButtonType.tertiary;
  }

  final Widget child;
  final bool expand;
  final void Function() onTap;
  final TextStyle? textStyle;
  final double? height;

  late final ButtonType type;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) => switch (widget.type) {
        ButtonType.primary => _ButtonPrimary(
            expand: widget.expand,
            onTap: widget.onTap,
            textStyle: widget.textStyle,
            height: widget.height,
            child: widget.child,
          ),
        ButtonType.secondary => _ButtonSecondary(
            expand: widget.expand,
            onTap: widget.onTap,
            textStyle: widget.textStyle,
            height: widget.height,
            child: widget.child,
          ),
        ButtonType.tertiary => _ButtonTertiary(
            expand: widget.expand,
            onTap: widget.onTap,
            textStyle: widget.textStyle,
            child: widget.child,
          )
      };
}
