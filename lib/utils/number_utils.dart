import 'dart:developer';

class NumberUtils {
  static int calculatePlaceHolderCount(int len) {
    var length = len;
    log("length: $length");

    if (length == 12) {
      return 1;
    } else if (length == 11) {
      return 2;
    } else if (length == 10) {
      return 3;
    } else if (length == 9) {
      return 4;
    } else if (length == 8) {
      return 5;
    } else if (length == 7) {
      return 6;
    } else if (length == 6) {
      return 7;
    } else if (length == 5) {
      return 8;
    } else if (length == 4) {
      return 9;
    } else if (length == 3) {
      return 10;
    } else if (length == 2) {
      return 11;
    } else if (length == 1) {
      return 12;
    }
    return 0;
  }
}
