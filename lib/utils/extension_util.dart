import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  // ignore: unused_element
  pushReplaceScreen(String screenName) =>
      Navigator.of(this).pushReplacementNamed(screenName);
}

extension IntExt on int {
  List<int> get range {
    switch (this) {
      case 0:
        return [0, 100];
      case 1:
        return [20, 30];
      case 2:
        return [31, 40];
      case 3:
        return [41, 50];
      case 4:
        return [51, 60];
      case 5:
        return [61, 70];
      case 6:
        return [71, 80];
      case 7:
        return [81, 90];
      default:
        return [0, 0];
    }
  }
}
