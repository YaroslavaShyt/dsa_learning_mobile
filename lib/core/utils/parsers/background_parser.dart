import 'package:flutter/foundation.dart';

abstract interface class IBackgroundParser {
  Future<T> parse<T>({
    required T Function(Map<dynamic, dynamic>) parseFunction,
    required Map<dynamic, dynamic> data,
  });
}

class BackgroundParser implements IBackgroundParser {
  @override
  Future<T> parse<T>({
    required T Function(Map<dynamic, dynamic>) parseFunction,
    required Map<dynamic, dynamic> data,
  }) async {
    return compute(parseFunction, data);
  }
}
