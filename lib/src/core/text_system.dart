import 'package:flutter/painting.dart';

final textSystem = TextSystem();

class TextSystem {
  final heading = _Heading();
  final body = _Body();
  final action = _Action();
  final caption = _Caption();
}

class _Heading {
  final h1 = const TextStyle(fontSize: 24, fontWeight: FontWeight.w900);
  final h2 = const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);
  final h3 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w900);
  final h4 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w800);
  final h5 = const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);
}

class _Body {
  final xl = const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  final l = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  final m = const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  final s = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  final xs = const TextStyle(fontSize: 10, fontWeight: FontWeight.w500);
}

class _Action {
  final l = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  final m = const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  final s = const TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
}

class _Caption {
  final m = const TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
}
