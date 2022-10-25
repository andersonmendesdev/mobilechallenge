// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mobilechallenge/src/core/export.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixfeature/fixture_reader.dart';
import 'http_helper_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<Client>(),
  MockSpec<Encoding>(),
])
void main() {
  late Uri uri;
  late HTTPHeader header;
  late HTTPHelper httpHelper;
  late MockClient httpClient;
  late MockEncoding encoding;
  late HttpRequestParameters parameterMultipart;
  late HttpRequestParameters parameter;
  late HttpRequestParameters parameterPost;
  late HttpRequestParameters parameterDelete;
  late HttpRequestParameters parameterQuery;
  late HttpRequestParameters parameterQueryEncode;
  late String bodyString;
  late dynamic bodyJson;
  late Uri uriResult;
  late Uri uriResultQuery;
  late Uri uriResultQueryEncode;
  late Response responseSuccess;
  late Response responseError;
  setUp(() {
    header = const HTTPHeader(userAgent: '');
    httpClient = MockClient();
    encoding = MockEncoding();
    bodyString = fixture('user_body.txt');
    bodyJson = json.decode(fixture('user_results.json'));
    uri = Uri.https('randomuser.me', '/api');

    parameterMultipart = HttpRequestParameters(
        uri: 'randomuser.me',
        paths: '/api',
        header: header.headerGetNoAuth(),
        method: HTTPMethodEnum.multipart,
        body: <String, String>{});

    parameterPost = parameterDelete = HttpRequestParameters(
        uri: 'randomuser.me',
        paths: '/api',
        header: header.headerGetNoAuth(),
        method: HTTPMethodEnum.post,
        body: <String, String>{});
    parameterDelete = HttpRequestParameters(
        uri: 'randomuser.me',
        paths: '/api',
        header: header.headerGetNoAuth(),
        method: HTTPMethodEnum.delete);

    httpHelper = HTTPHelper(encoding: encoding, httpClient: httpClient);

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
        queryParams: const <String, String>{'results': '50'});
    uriResultQuery =
        Uri.https('randomuser.me', '/api', <String, String>{'results': '50'});

    parameterQueryEncode = HttpRequestParameters(
      uri: 'randomuser.me',
      paths: '/api',
      header: header.headerGetNoAuth(),
      method: HTTPMethodEnum.get,
      isEncodedURI: false,
      queryParams: const <String, String>{'results': '50'},
    );
    uriResultQueryEncode = Uri.parse(Uri.decodeFull(uriResultQuery.toString()));

    responseSuccess = Response(fixture('user_body.txt'), 200);
    responseError = Response(fixture('user_body_error.txt'), 200);
  });

  group('HTTP helper', () {
    test('should return dynamic type when calling jsonDecod', () async {
      var result = await httpHelper.jsonDecod(bodyString);
      expect(result, TypeMatcher<dynamic>());
    });

    test('should return uri when calling getUri', () async {
      var result = await httpHelper.getURi(parameter);
      expect(result, equals(uri));
    });

    test('should return uri when calling getUri params is notEmpty', () async {
      var result = await httpHelper.getURi(parameterQuery);
      expect(result, equals(uriResultQuery));
    });

    test(
        'should return uri when calling getUri params is notEmpty and isencode false',
        () async {
      var result = await httpHelper.getURi(parameterQueryEncode);
      expect(result, equals(uriResultQueryEncode));
    });

    test('should return response when calling getClientHttp get', () async {
      when(httpClient.get(uri)).thenAnswer((_) async => responseSuccess);
      var result = await httpHelper.getClientHttp(parameter);
      expect(result, TypeMatcher<Response>());
    });
    test('should return response when calling getClientHttp post', () async {
      when(httpClient.post(uri,
              body: <String, String>{},
              encoding: encoding,
              headers: header.headerGetNoAuth()))
          .thenAnswer((_) async => responseSuccess);
      var result = await httpHelper.getClientHttp(parameterPost);
      expect(result, TypeMatcher<Response>());
    });
    test('should return response when calling getClientHttp delete', () async {
      when(httpClient.delete(uri, headers: header.headerGetNoAuth()))
          .thenAnswer((_) async => responseSuccess);
      var result = await httpHelper.getClientHttp(parameterDelete);
      expect(result, TypeMatcher<Response>());
    });
    test('should return response when calling getClientHttp get', () async {
      when(httpClient.post(uri, headers: header.headerGetNoAuth()))
          .thenAnswer((_) async => responseSuccess);
      var result = await httpHelper.getClientHttp(parameterMultipart);
      expect(result, TypeMatcher<Response>());
    });

  });
}
