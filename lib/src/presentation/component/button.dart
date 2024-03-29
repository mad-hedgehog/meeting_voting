import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({
    super.key,
    this.pressed = false,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final bool pressed;
  final void Function() onTap;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  MaterialState? _lastState;
  MaterialState? _state;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: _mouseEnter,
      onExit: _mouseExit,
      child: GestureDetector(
        onTapDown: _pressedDown,
        onTapUp: _pressedCancel,
        onTapCancel: _pressedCancel,
        onTap: widget.onTap,
        child: Container(
          padding: switch (widget.pressed) {
            true => const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            false => const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          },
          decoration: BoxDecoration(
            border: Border.all(
              color: switch (widget.pressed) {
                true => Colors.deepPurple.shade500,
                false when _state == MaterialState.hovered => Colors.deepPurple.shade300,
                false when _state == MaterialState.pressed => Colors.deepPurple.shade900,
                _ => Colors.grey,
              },
              width: switch (widget.pressed) {
                true => 2,
                _ => 1,
              },
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: widget.child,
        ),
      ),
    );
  }

  void _pressedCancel([TapUpDetails? details]) {
    setState(() {
      _state = _lastState;
    });
  }

  void _pressedDown(TapDownDetails details) {
    setState(() {
      _lastState = _state;
      _state = MaterialState.pressed;
    });
  }

  void _mouseExit(PointerExitEvent event) {
    setState(() {
      _state = null;
    });
  }

  void _mouseEnter(PointerEnterEvent event) {
    setState(() {
      _state = MaterialState.hovered;
    });
  }
}
