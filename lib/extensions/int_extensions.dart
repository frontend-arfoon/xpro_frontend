import 'package:flutter/material.dart';

extension IntExt on int {
  Widget get spacesH => SizedBox(height: this.toDouble());
  Widget get spacesW => SizedBox(width: this.toDouble());
}

