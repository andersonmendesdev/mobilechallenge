// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mobilechallenge/src/core/export.dart';
import 'package:mobilechallenge/src/data/datasource/remote/user_remote_data_source_impl.dart';
import 'package:mobilechallenge/src/domain/entities/user_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../fixfeature/fixture_reader.dart';
import '../../core/http/http_header_test.mocks.dart';
import '../../core/http/http_helper_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Client>(), MockSpec<Encoding?>()])
void main() {
  // late MockClient mockClient;
  // late MockEncoding mockEncoding;
  late UserRemoteDataSourceImpl remoteDataSourceImpl;
  late MockHTTPHelper httpHelper;
  late MockHTTPHeader httpHeader;
  late dynamic bodySuccess;
  late dynamic bodyError;
  late String bodySuccessString;
  late String bodyErrorString;
  late Response responseSuccess;
  late Response responseError;
  late Response responseErro400;
  late Response responseSuccessEmpty;
  late HttpRequestParameters parameterQuery;

  setUp(() {
    // mockClient = MockClient();
    // mockEncoding = MockEncoding();
    httpHeader = MockHTTPHeader();
    httpHelper = MockHTTPHelper();
    remoteDataSourceImpl = UserRemoteDataSourceImpl(httpHelper: httpHelper);

    bodySuccessString = fixture('user_body.txt');
    bodyErrorString = fixture('user_body_error.txt');
    bodySuccess = json.decode(fixture('user_results.json'));
    bodyError = json.decode(fixture('user_body_error.txt'));
    responseSuccess = Response(bodySuccessString, 200);
    responseError = Response(bodyError, 200);
    responseErro400 = Response(bodyError, 400);
    responseSuccessEmpty = Response('empty', 200);
    parameterQuery = HttpRequestParameters(
        uri: 'randomuser.me',
        paths: '/api',
        header: httpHeader.headerGetNoAuth(),
        method: HTTPMethodEnum.get,
        queryParams: const <String, String>{'results': '50'});
  });


  //
  void setUpMockClient200Error() {
    when(httpHelper.getClientHttp(parameterQuery))
        .thenAnswer((_) async => responseError);
  }

  group('Get all user', () {
    test('''should perform a GET request on a URL being HttpRequestParameters
     and with the application/json header''', () async {
      //arrange
      when(httpHelper.getClientHttp(parameterQuery))
          .thenAnswer((_) async => responseSuccess);
      when(httpHelper.jsonDecod(responseSuccess.body))
          .thenAnswer((_) async => bodySuccess);
      //act
      await remoteDataSourceImpl.getAll(parameterQuery);
      //assert
      verify(httpHelper.getClientHttp(parameterQuery));
    });

    test(
        'should return List<UserEntity> whe the response code is 200 (success)',
        () async {
      //arrange
      when(httpHelper.getClientHttp(parameterQuery))
          .thenAnswer((_) async => responseSuccess);
      when(httpHelper.jsonDecod(responseSuccess.body))
          .thenAnswer((_) async => bodySuccess);
      //act
      var result = await remoteDataSourceImpl.getAll(parameterQuery);
      //assert
      expect(result, isA<List<UserEntity>>());
    });

    test('should return error message when there is no results object.',
        () async {
      //arrange
      setUpMockClient200Error();
      when(httpHelper.jsonDecod(responseError.body))
          .thenAnswer((_) async => bodyError);
      //act
      //assert
      expect(() async => remoteDataSourceImpl.getAll(parameterQuery),
          throwsA(TypeMatcher<ApiException>()));
    });

    test('should return error message when status code not 200', () async {
      //arrange
      when(httpHelper.getClientHttp(parameterQuery))
          .thenAnswer((_) async => responseErro400);
      when(httpHelper.jsonDecod(responseErro400.body))
          .thenAnswer((_) async => bodyError);
      //act
      //assert
      expect(() async => remoteDataSourceImpl.getAll(parameterQuery),
          throwsA(TypeMatcher<ApiException>()));
    });
    test(
        'should return error message when there is no results or error object.',
        () async {
      //arrange
      when(httpHelper.getClientHttp(parameterQuery))
          .thenAnswer((_) async => responseSuccessEmpty);
      when(httpHelper.jsonDecod(responseSuccessEmpty.body))
          .thenAnswer((_) async => '');
      //act
      //assert
      expect(() async => remoteDataSourceImpl.getAll(parameterQuery),
          throwsA(TypeMatcher<ApiException>()));
    });
  });
}
