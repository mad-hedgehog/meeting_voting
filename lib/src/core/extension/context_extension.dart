import 'package:flutter/cupertino.dart';
import 'package:meeting_voting/src/core/color_system.dart';
import 'package:meeting_voting/src/core/text_system.dart';

extension ContextExtension on BuildContext {
  ColorSystem get colorSystem => ColorSystem.of(this);

  TextSystem get textSystem => TextSystem.of(this);
}
