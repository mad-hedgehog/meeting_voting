import 'package:flutter/material.dart';

abstract class TextSystem {
  TextSystem._();

  static late BuildContext _context;

  // 초기화 메서드
  static void init(BuildContext context) => _context = context;

  static get heading => _Heading;
  static get body => _Body;
  static get action => _Action;
  static get caption => _Caption;
}

abstract class _Heading {
  _Heading._();

  static get h1 => const TextStyle(fontSize: 24, fontWeight: FontWeight.w900);
  static get h2 => const TextStyle(fontSize: 18, fontWeight: FontWeight.w900);
  static get h3 => const TextStyle(fontSize: 16, fontWeight: FontWeight.w900);
  static get h4 => const TextStyle(fontSize: 14, fontWeight: FontWeight.w800);
  static get h5 => const TextStyle(fontSize: 12, fontWeight: FontWeight.w700);
}

abstract class _Body {
  _Body._();

  static get xl => const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  static get l => const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  static get m => const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static get s => const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);
  static get xs => const TextStyle(fontSize: 10, fontWeight: FontWeight.w500);
}

abstract class _Action {
  _Action._();

  static get l => const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
  static get m => const TextStyle(fontSize: 12, fontWeight: FontWeight.w600);
  static get s => const TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
}

abstract class _Caption {
  _Caption._();

  static get m => const TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
}
