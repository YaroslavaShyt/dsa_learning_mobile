import 'package:flutter/foundation.dart';

abstract interface class IBackgroundParser {
  Future<T> parse<T>({
    required Future<T> Function(Map<String, dynamic> data) parseFunction,
    required Map<String, dynamic> data,
  });
}

class BackgroundParser implements IBackgroundParser {
  @override
  Future<T> parse<T>({
    required Future<T> Function(Map<String, dynamic> data) parseFunction,
    required Map<String, dynamic> data,
  }) async {
    return compute(parseFunction, data);
  }
}
