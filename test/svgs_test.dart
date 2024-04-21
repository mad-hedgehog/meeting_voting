import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:meeting_voting/resources/resources.dart';

void main() {
  test('svgs assets test', () {
    expect(File(Svgs.add).existsSync(), isTrue);
    expect(File(Svgs.apple).existsSync(), isTrue);
    expect(File(Svgs.arrowDown).existsSync(), isTrue);
    expect(File(Svgs.arrowLeft).existsSync(), isTrue);
    expect(File(Svgs.arrowRight).existsSync(), isTrue);
    expect(File(Svgs.arrowUp).existsSync(), isTrue);
    expect(File(Svgs.camera).existsSync(), isTrue);
    expect(File(Svgs.categories).existsSync(), isTrue);
    expect(File(Svgs.chat).existsSync(), isTrue);
    expect(File(Svgs.check).existsSync(), isTrue);
    expect(File(Svgs.close).existsSync(), isTrue);
    expect(File(Svgs.create).existsSync(), isTrue);
    expect(File(Svgs.delete).existsSync(), isTrue);
    expect(File(Svgs.edit).existsSync(), isTrue);
    expect(File(Svgs.energy).existsSync(), isTrue);
    expect(File(Svgs.explore).existsSync(), isTrue);
    expect(File(Svgs.eyeInvisible).existsSync(), isTrue);
    expect(File(Svgs.eyeVisible).existsSync(), isTrue);
    expect(File(Svgs.facebook).existsSync(), isTrue);
    expect(File(Svgs.filter).existsSync(), isTrue);
    expect(File(Svgs.google).existsSync(), isTrue);
    expect(File(Svgs.hamburgerMenu).existsSync(), isTrue);
    expect(File(Svgs.heartFilled).existsSync(), isTrue);
    expect(File(Svgs.heartOutlined).existsSync(), isTrue);
    expect(File(Svgs.image).existsSync(), isTrue);
    expect(File(Svgs.inbox).existsSync(), isTrue);
    expect(File(Svgs.info).existsSync(), isTrue);
    expect(File(Svgs.linkedIn).existsSync(), isTrue);
    expect(File(Svgs.minus).existsSync(), isTrue);
    expect(File(Svgs.placeholder).existsSync(), isTrue);
    expect(File(Svgs.play).existsSync(), isTrue);
    expect(File(Svgs.profile).existsSync(), isTrue);
    expect(File(Svgs.search).existsSync(), isTrue);
    expect(File(Svgs.send).existsSync(), isTrue);
    expect(File(Svgs.settings).existsSync(), isTrue);
    expect(File(Svgs.shoppingBagFilled).existsSync(), isTrue);
    expect(File(Svgs.shoppingBagOutlined).existsSync(), isTrue);
    expect(File(Svgs.sort).existsSync(), isTrue);
    expect(File(Svgs.starFilled).existsSync(), isTrue);
    expect(File(Svgs.starOutlined).existsSync(), isTrue);
    expect(File(Svgs.store).existsSync(), isTrue);
    expect(File(Svgs.success).existsSync(), isTrue);
    expect(File(Svgs.warning).existsSync(), isTrue);
  });
}
