import 'package:flutter/material.dart';

abstract class ColorSystem {
  ColorSystem._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) {
    _context = context;

    _Highlight.init(_context);
    _Neutral.init(_context);
    _Support.init(_context);
  }

  static get highlight => _Highlight;
  static get neutral => _Neutral;
  static get support => _Support;
}

abstract class _Highlight {
  _Highlight._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) => _context = context;

  static get darkest => MediaQuery.of(_context).platformBrightness == Brightness.light ? const Color(0xff003d84) : const Color(0xff003d84);
  static get dark => const Color(0xff33639c);
  static get medium => const Color(0xff668ab5);
  static get light => const Color(0xff99B1CE);
  static get lightest => const Color(0xffCCD8E6);
}

abstract class _Neutral {
  _Neutral._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) {
    _context = context;

    _NeutralLight.init(context);
    _NeutralDark.init(context);
  }

  static get light => _NeutralLight;
  static get dark => _NeutralDark;
}

abstract class _NeutralLight {
  _NeutralLight._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) => _context = context;

  static get darkest => const Color(0xffc5c6cc);
  static get dark => const Color(0xffd4d6dd);
  static get medium => const Color(0xffe8e9f1);
  static get light => const Color(0xfff8f9ff);
  static get lightest => const Color(0xffffffff);
}

abstract class _NeutralDark {
  _NeutralDark._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) => _context = context;

  static get darkest => const Color(0xff1f2024);
  static get dark => const Color(0xff2f3036);
  static get medium => const Color(0xff494a50);
  static get light => const Color(0xff71727a);
  static get lightest => const Color(0xff8f9098);
}

abstract class _Support {
  _Support._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) {
    _context = context;

    _SupportSuccess.init(context);
    _SupportWarning.init(context);
    _SupportError.init(context);
  }

  static get success => _SupportSuccess;
  static get warning => _SupportWarning;
  static get error => _SupportError;
}

abstract class _SupportSuccess {
  _SupportSuccess._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) => _context = context;

  static get dark => const Color(0xff298267);
  static get medium => const Color(0xff3ac0a0);
  static get light => const Color(0xffe7f4e8);
}

abstract class _SupportWarning {
  _SupportWarning._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) => _context = context;

  static get dark => const Color(0xffe86339);
  static get medium => const Color(0xffffb37c);
  static get light => const Color(0xfffff4e4);
}

abstract class _SupportError {
  _SupportError._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) => _context = context;

  static get dark => const Color(0xffed3241);
  static get medium => const Color(0xffff616d);
  static get light => const Color(0xffffe2e5);
}
