import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mobilechallenge/src/core/export.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixfeature/fixture_reader.dart';
import 'http_helper_test.mocks.dart';

@GenerateNiceMocks([MockSpec<HTTPHelper>()])
void main() {
  late MockHTTPHelper httpHelper;
  late HTTPHeader header;
  late HttpRequestParameters parameter;
  late HttpRequestParameters parameterQuery;
  late HttpRequestParameters parameterQueryEncode;
  late Response responseSuccess;
  late Response responseError;

  late Map bodySuccess;
  late String bodyString;

  late Uri uriResult;
  late Uri uriResultQuery;
  late Uri uriResultQueryEncode;

  setUp(() {
    httpHelper = MockHTTPHelper();
    header = const HTTPHeader(userAgent: '');

    parameter = HttpRequestParameters(
        uri: 'randomuser.me',
        paths: '/api',
        header: header.headerGetNoAuth(),
        method: HTTPMethodEnum.get);

    uriResult = Uri.https('randomuser.me', '/api');

    parameterQuery = HttpRequestParameters(
        uri: 'randomuser.me',
        paths: '/api',
        header: header.headerGetNoAuth(),
        method: HTTPMethodEnum.get,
        queryParams: const <String, String>{
          'results': '50'
        }
    );
    uriResultQuery = Uri.https('randomuser.me', '/api', <String, String>{
      'results': '50'
    });

    parameterQueryEncode = HttpRequestParameters(
      uri: 'randomuser.me',
      paths: '/api',
      header: header.headerGetNoAuth(),
      method: HTTPMethodEnum.get,
      isEncodedURI: false,
      queryParams: const <String, String>{
        'results': '50'
      },

    );
    uriResultQueryEncode = Uri.parse(Uri.decodeFull(uriResultQuery.toString()));

    bodyString = fixture('user_body.txt');
    bodySuccess = json.decode(fixture('user_results.json'));
    responseSuccess = Response(bodyString, 200);
    responseError = Response(fixture('user_body_error.txt'), 200);
  });

  group('HTTPHelper', () {
    test(
        'should return a response success when getClientHttp is called', () async {
      when(httpHelper.getClientHttp(parameter))
          .thenAnswer((_) async => responseSuccess);
      var result = await httpHelper.getClientHttp(parameter);
      expect(result, responseSuccess);
    });

    test('should return a response 200 when getClientHttp is called', () async {
      when(httpHelper.getClientHttp(parameter))
          .thenAnswer((_) async => responseSuccess);
      var result = await httpHelper.getClientHttp(parameter);
      expect(result.statusCode, 200);
    });

    test(
        'should return a response failure when getClientHttp is called', () async {
      when(httpHelper.getClientHttp(parameter))
          .thenAnswer((_) async => responseError);
      var result = await httpHelper.getClientHttp(parameter);
      expect(result, equals(responseError));
    });


    test('should return a Map when jsonDecod is called', () async {
      when(httpHelper.jsonDecod(bodyString))
          .thenAnswer((_) async => bodySuccess);
      var result = await httpHelper.jsonDecod(bodyString);
      expect(result, equals(bodySuccess));
    });

    test('should return a url when getUri is called', () async {
      when(httpHelper.getURi(parameter))
          .thenAnswer((_) async => uriResult);
      var result = await httpHelper.getURi(parameter);
      expect(result, equals(uriResult));
    });

    test('should return a url with query when getUri is called', () async {
      when(httpHelper.getURi(parameterQuery))
          .thenAnswer((_) async => uriResultQuery);
      var result = await httpHelper.getURi(parameterQuery);
      expect(result, equals(uriResultQuery));
    });

    test(
        'should return a url with unencoded query when getUri is called', () async {
      when(httpHelper.getURi(parameterQueryEncode))
          .thenAnswer((_) async => uriResultQueryEncode);
      var result = await httpHelper.getURi(parameterQueryEncode);
      expect(result, equals(uriResultQueryEncode));
    });
  });
}
