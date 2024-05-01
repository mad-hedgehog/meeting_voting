import 'package:flutter/material.dart';

class ColorSystem {
  ColorSystem.of(this.context);
  final BuildContext context;

  final highLight = _HighLight();
  final neutral = _Neutral();
  final support = _Support();
}

class _HighLight {
  _HighLight._();

  static final _HighLight _instance = _HighLight._();

  factory _HighLight() => _instance;

  final Color darkest = const Color(0xff003d84);
  final Color dark = const Color(0xff33639c);
  final Color medium = const Color(0xff668ab5);
  final Color light = const Color(0xff99B1CE);
  final Color lightest = const Color(0xffCCD8E6);
}

class _Neutral {
  _Neutral._();

  static final _Neutral _instance = _Neutral._();

  factory _Neutral() => _instance;

  final light = _NeutralLight();
  final dark = _NeutralDark();
}

class _NeutralLight {
  _NeutralLight._();

  static final _NeutralLight _instance = _NeutralLight._();

  factory _NeutralLight() => _instance;

  final Color darkest = const Color(0xffc5c6cc);
  final Color dark = const Color(0xffd4d6dd);
  final Color medium = const Color(0xffe8e9f1);
  final Color light = const Color(0xfff8f9ff);
  final Color lightest = const Color(0xffffffff);
}

class _NeutralDark {
  _NeutralDark._();

  static final _NeutralDark _instance = _NeutralDark._();

  factory _NeutralDark() => _instance;

  final Color darkest = const Color(0xff1f2024);
  final Color dark = const Color(0xff2f3036);
  final Color medium = const Color(0xff494a50);
  final Color light = const Color(0xff71727a);
  final Color lightest = const Color(0xff8f9098);
}

class _Support {
  _Support._();

  static final _Support _instance = _Support._();

  factory _Support() => _instance;

  final success = _SupportSuccess();
  final warning = _SupportWarning();
  final error = _SupportError();
}

class _SupportSuccess {
  _SupportSuccess._();

  static final _SupportSuccess _instance = _SupportSuccess._();

  factory _SupportSuccess() => _instance;

  final Color dark = const Color(0xff298267);
  final Color medium = const Color(0xff3ac0a0);
  final Color light = const Color(0xffe7f4e8);
}

class _SupportWarning {
  _SupportWarning._();

  static final _SupportWarning _instance = _SupportWarning._();

  factory _SupportWarning() => _instance;

  final Color dark = const Color(0xffe86339);
  final Color medium = const Color(0xffffb37c);
  final Color light = const Color(0xfffff4e4);
}

class _SupportError {
  _SupportError._();

  static final _SupportError _instance = _SupportError._();

  factory _SupportError() => _instance;

  final Color dark = const Color(0xffed3241);
  final Color medium = const Color(0xffff616d);
  final Color light = const Color(0xffffe2e5);
}
