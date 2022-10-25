// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mobilechallenge/src/core/error/exceptions.dart';

void main() {
  late String message;
  late ApiException exception;

  setUp(() {
    message = 'Error message';
    exception = ApiException(message);
  });

  group('Errors', () {
    test('should return a string when calling toString', () async {
      var result = exception.toString();

      expect(result, TypeMatcher<String>());
    });

    test('should return a messagem passed to the constructor or call toString', () async {
      var result = exception.toString();

      expect(result, equals(message));
    });
  });
}
