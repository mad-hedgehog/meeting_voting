import 'dart:ui';

final colorSystem = ColorSystem();

class ColorSystem {
  final highlight = _Highlight();
  final neutral = _Neutral();
  final support = _Support();
}

class _Highlight {
  final darkest = const Color(0xff003d84);
  final dark = const Color(0xff33639c);
  final medium = const Color(0xff668ab5);
  final light = const Color(0xff99B1CE);
  final lightest = const Color(0xffCCD8E6);
}

class _Neutral {
  final light = _NeutralLight();
  final dark = _NeutralDark();
}

class _NeutralLight {
  final darkest = const Color(0xffc5c6cc);
  final dark = const Color(0xffd4d6dd);
  final medium = const Color(0xffe8e9f1);
  final light = const Color(0xfff8f9ff);
  final lightest = const Color(0xffffffff);
}

class _NeutralDark {
  final darkest = const Color(0xff1f2024);
  final dark = const Color(0xff2f3036);
  final medium = const Color(0xff494a50);
  final light = const Color(0xff71727a);
  final lightest = const Color(0xff8f9098);
}

class _Support {
  final success = _SupportSuccess();
  final warning = _SupportWarning();
  final error = _SupportError();
}

class _SupportSuccess {
  final dark = const Color(0xff298267);
  final medium = const Color(0xff3ac0a0);
  final light = const Color(0xffe7f4e8);
}

class _SupportWarning {
  final dark = const Color(0xffe86339);
  final medium = const Color(0xffffb37c);
  final light = const Color(0xfffff4e4);
}

class _SupportError {
  final dark = const Color(0xffed3241);
  final medium = const Color(0xffff616d);
  final light = const Color(0xffffe2e5);
}
