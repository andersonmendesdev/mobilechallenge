// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:mobilechallenge/src/core/export.dart';

void main() {
  late HttpRequestParameters params;
  late HTTPHeader header;

  setUp(() {
    header = HTTPHeader(userAgent: '');
    params = HttpRequestParameters(
        uri: 'ramdon/me',
        paths: '/api',
        header: header.headerGetNoAuth(),
        method: HTTPMethodEnum.get);
  });

  group('HttpRequestParameters', () {
    test('shoulr return copyWith HttpRequestParameters', () async {
      var paramsCopyWith = params.copyWith();
      
      expect(params.hashCode, equals(paramsCopyWith.hashCode));
    });

    test('should return a string when calling toString', () async {
      var result = params.toString();

      expect(result, TypeMatcher<String>());
    });
  });
}
