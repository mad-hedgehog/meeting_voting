part of 'button.dart';

class _ButtonPrimary extends StatefulWidget {
  const _ButtonPrimary({
    required this.child,
    this.expand = false,
    required this.onTap,
    this.textStyle,
    this.height,
  });

  final Widget child;
  final bool expand;
  final void Function() onTap;
  final TextStyle? textStyle;
  final double? height;

  @override
  State<_ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<_ButtonPrimary> {
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
          height: widget.height ?? 40,
          decoration: BoxDecoration(
            color: ColorSystem.highlight.darkest,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: widget.expand ? Alignment.center : null,
          child: DefaultTextStyle(
            style: TextSystem.action.m.copyWith(
              fontSize: widget.textStyle?.fontSize,
              fontWeight: widget.textStyle?.fontWeight,
              height: widget.textStyle?.height,
              color: widget.textStyle?.color ?? ColorSystem.neutral.light.lightest,
            ),
            child: widget.child,
          ),
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
