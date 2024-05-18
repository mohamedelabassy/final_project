import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double width() => MediaQuery.sizeOf(this).width;

  double height() => MediaQuery.sizeOf(this).height;
}
