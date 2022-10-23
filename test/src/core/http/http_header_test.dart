import 'package:flutter_test/flutter_test.dart';
import 'package:mobilechallenge/src/core/export.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'http_header_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HTTPHeader>()])
void main(){
  late MockHTTPHeader httpHeader;

  setUp(() async {
    httpHeader = MockHTTPHeader();
  });

  test('should expect a header to type Map<String, String>', () async {
    when(httpHeader.headerGetNoAuth()).thenAnswer((_) => <String, String>{});
    var result = httpHeader.headerGetNoAuth();
    expect(result, isA<Map<String, String>>());
  });
}