import 'package:dsa_learning/presentation/initial/loader/loader_screen.dart';
import 'package:flutter/material.dart';

class LoaderArgs {
  LoaderArgs({
    required this.loadingText,
    required this.loadedText,
  });

  final String loadingText;
  final String loadedText;
}

class LoaderFactory {
  static Widget build(LoaderArgs args) {
    return LoaderScreen(
      loadedText: args.loadedText,
      loadingText: args.loadingText,
      isLoadingInProgress: true,
    );
  }
}
