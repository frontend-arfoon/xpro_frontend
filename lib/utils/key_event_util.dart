import 'package:flutter/services.dart';

class KeyEventUtil {
  //
  static bool isAlphaKey(RawKeyDownEvent event) {
    return event.logicalKey.keyLabel.contains(RegExp(r'[a-zA-Z]'));
  }

  static bool isAlphaKey2(RawKeyEvent event) {
    return event.logicalKey.keyLabel.contains(RegExp(r'[a-zA-Z]'));
  }

  static bool isNumericKey(RawKeyDownEvent event) {
    return event.logicalKey.keyLabel.contains(RegExp(r'[0-9]'));
  }

  static bool isTyping(PhysicalKeyboardKey physicalKey) {
    var keys = [
      PhysicalKeyboardKey.keyA,
      PhysicalKeyboardKey.keyB,
      PhysicalKeyboardKey.keyC,
      PhysicalKeyboardKey.keyD,
      PhysicalKeyboardKey.keyE,
      PhysicalKeyboardKey.keyF,
      PhysicalKeyboardKey.keyG,
      PhysicalKeyboardKey.keyH,
      PhysicalKeyboardKey.keyI,
      PhysicalKeyboardKey.keyJ,
      PhysicalKeyboardKey.keyK,
      PhysicalKeyboardKey.keyL,
      PhysicalKeyboardKey.keyM,
      PhysicalKeyboardKey.keyN,
      PhysicalKeyboardKey.keyO,
      PhysicalKeyboardKey.keyP,
      PhysicalKeyboardKey.keyQ,
      PhysicalKeyboardKey.keyR,
      PhysicalKeyboardKey.keyS,
      PhysicalKeyboardKey.keyT,
      PhysicalKeyboardKey.keyU,
      PhysicalKeyboardKey.keyV,
      PhysicalKeyboardKey.keyW,
      PhysicalKeyboardKey.keyX,
      PhysicalKeyboardKey.keyY,
      PhysicalKeyboardKey.keyZ,
      PhysicalKeyboardKey.digit1,
      PhysicalKeyboardKey.digit2,
      PhysicalKeyboardKey.digit3,
      PhysicalKeyboardKey.digit4,
      PhysicalKeyboardKey.digit5,
      PhysicalKeyboardKey.digit6,
      PhysicalKeyboardKey.digit7,
      PhysicalKeyboardKey.digit8,
      PhysicalKeyboardKey.digit9,
      PhysicalKeyboardKey.digit0,
      PhysicalKeyboardKey.enter,
      PhysicalKeyboardKey.backspace,
      PhysicalKeyboardKey.space,
      PhysicalKeyboardKey.minus,
      PhysicalKeyboardKey.equal,
      PhysicalKeyboardKey.bracketLeft,
      PhysicalKeyboardKey.bracketRight,
      PhysicalKeyboardKey.backslash,
      PhysicalKeyboardKey.semicolon,
      PhysicalKeyboardKey.quote,
      PhysicalKeyboardKey.backquote,
      PhysicalKeyboardKey.comma,
      PhysicalKeyboardKey.period,
      PhysicalKeyboardKey.slash,
      PhysicalKeyboardKey.delete,
      PhysicalKeyboardKey.pageDown,
      PhysicalKeyboardKey.numpad1,
      PhysicalKeyboardKey.numpad2,
      PhysicalKeyboardKey.numpad3,
      PhysicalKeyboardKey.numpad4,
      PhysicalKeyboardKey.numpad5,
      PhysicalKeyboardKey.numpad6,
      PhysicalKeyboardKey.numpad7,
      PhysicalKeyboardKey.numpad8,
      PhysicalKeyboardKey.numpad9,
      PhysicalKeyboardKey.numpad0,
    ];
    return keys.any((nk) => nk == physicalKey);
  }
}
