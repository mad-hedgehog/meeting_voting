import 'package:flutter/material.dart';

class TextSystem {
  TextSystem.of(this.context);

  final BuildContext context;

  final heading = _Heading();
  final body = _Body();
  final action = _Action();
  final caption = _Caption();
}

class _Heading {
  _Heading._();

  static final _Heading _instance = _Heading._();

  factory _Heading() => _instance;

  final TextStyle h1 = const TextStyle(fontSize: 24, fontWeight: FontWeight.w900);
  final TextStyle h2 = const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);
  final TextStyle h3 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w900);
  final TextStyle h4 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w800);
  final TextStyle h5 = const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);
}

class _Body {
  _Body._();

  static final _Body _instance = _Body._();

  factory _Body() => _instance;

  final TextStyle xl = const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  final TextStyle l = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  final TextStyle m = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  final TextStyle s = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  final TextStyle xs = const TextStyle(fontSize: 10, fontWeight: FontWeight.w500);
}

class _Action {
  _Action._();

  static final _Action _instance = _Action._();

  factory _Action() => _instance;

  final TextStyle l = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  final TextStyle m = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  final TextStyle s = const TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
}

class _Caption {
  _Caption._();

  static final _Caption _instance = _Caption._();

  factory _Caption() => _instance;

  final TextStyle m = const TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
}
