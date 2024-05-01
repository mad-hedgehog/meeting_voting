part of 'button.dart';

class _ButtonTertiary extends StatefulWidget {
  const _ButtonTertiary({
    required this.child,
    this.expand = false,
    required this.onTap,
    this.textStyle,
  });

  final Widget child;
  final bool expand;
  final void Function() onTap;
  final TextStyle? textStyle;

  @override
  State<_ButtonTertiary> createState() => _ButtonTertiaryState();
}

class _ButtonTertiaryState extends State<_ButtonTertiary> {
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
        child: DefaultTextStyle(
          style: context.textSystem.action.m.copyWith(
            fontSize: widget.textStyle?.fontSize,
            fontWeight: widget.textStyle?.fontWeight,
            height: widget.textStyle?.height,
            color: widget.textStyle?.color ?? context.colorSystem.highLight.darkest,
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
