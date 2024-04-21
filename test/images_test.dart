import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:meeting_voting/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.loginImage).existsSync(), isTrue);
  });
}
