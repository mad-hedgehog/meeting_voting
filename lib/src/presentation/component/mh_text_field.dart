import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:meeting_voting/resources/resources.dart';
import 'package:meeting_voting/src/core/color_system.dart';
import 'package:meeting_voting/src/core/text_system.dart';

enum _TextFieldState { idle, focused, filled, error, disabled }

class MHTextField extends StatefulWidget {
  const MHTextField({
    super.key,
    this.title,
    this.placeholder,
    this.supportText,
    this.unit,
    this.controller,
    this.obscureText = false,
    this.disabled = false,
    this.validator,
  });

  final String? title;
  final String? placeholder;
  final String? supportText;
  final Widget? unit;
  final TextEditingController? controller;
  final bool obscureText;
  final bool disabled;
  final String? Function(String?)? validator;

  @override
  State<MHTextField> createState() => _MHTextFieldState();
}

class _MHTextFieldState extends State<MHTextField> {
  _TextFieldState _state = _TextFieldState.idle;
  final FocusNode _focusNode = FocusNode();
  late final TextEditingController _controller;
  bool visibleIcon = false;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();

    if (widget.disabled) {
      _state = _TextFieldState.disabled;
    }

    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _state = _TextFieldState.idle;
        });
      } else {
        setState(() {
          _state = _TextFieldState.filled;
        });
      }
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _state = _TextFieldState.focused;
        });
      } else {
        setState(() {
          _state = _controller.text.isEmpty ? _TextFieldState.idle : _TextFieldState.filled;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    if (widget.controller != null) _controller.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(widget.title!, style: TextSystem.heading.h5),
          const Gap(8),
        ],
        TextFormField(
          controller: _controller,
          maxLines: 1,
          focusNode: _focusNode,
          obscureText: widget.obscureText && visibleIcon == false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: TextSystem.body.m.copyWith(fontWeight: FontWeight.w500),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorSystem.highlight.lightest),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: ColorSystem.highlight.darkest),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorSystem.highlight.darkest, width: 1.5),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: ColorSystem.support.error.medium),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            focusColor: ColorSystem.highlight.lightest,
            filled: true,
            fillColor: switch (_state) {
              _TextFieldState.idle => const Color(0xfff0f5eb),
              _ => Colors.white,
            },
            suffixIcon: switch (widget.obscureText) {
              false => null,
              true => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      visibleIcon = !visibleIcon;
                    }),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: SvgPicture.asset(
                        visibleIcon ? Svgs.eyeVisible : Svgs.eyeInvisible,
                        colorFilter: ColorFilter.mode(ColorSystem.highlight.medium, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ),
            },
            suffixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 38),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            hintText: widget.placeholder,
            hintStyle: TextSystem.body.m.copyWith(color: ColorSystem.neutral.dark.lightest),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
