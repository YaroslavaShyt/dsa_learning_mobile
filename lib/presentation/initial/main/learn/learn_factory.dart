import 'package:dsa_learning/presentation/initial/main/learn/learn_screen.dart';
import 'package:flutter/material.dart';

class LearnFactory {
  static Widget build() {
    return Builder(
      builder: (BuildContext context) {
        return LearnScreen();
      },
    );
  }
}
