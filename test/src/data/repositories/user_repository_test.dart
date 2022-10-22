// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mobilechallenge/src/core/export.dart';
import 'package:mobilechallenge/src/data/datasource/remote/user_remote_data_source_impl.dart';
import 'package:mobilechallenge/src/data/repositories/user_repository_impl.dart';
import 'package:mobilechallenge/src/domain/entities/user_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/http/http_header_test.mocks.dart';
import 'user_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserRemoteDataSourceImpl>()])
void main() {
  late UserRepositoryImpl repository;
  late MockUserRemoteDataSourceImpl remoteDataSourceImpl;
  late HttpRequestParameters parameterQuery;
  late MockHTTPHeader httpHeader;

  setUp(() {
    remoteDataSourceImpl = MockUserRemoteDataSourceImpl();
    repository = UserRepositoryImpl(remoteDataSource: remoteDataSourceImpl);
    httpHeader = MockHTTPHeader();
    parameterQuery = HttpRequestParameters(
        uri: 'randomuser.me',
        paths: '/api',
        header: httpHeader.headerGetNoAuth(),
        method: HTTPMethodEnum.get,
        queryParams: const <String, String>{'results': '50'});
  });

  group('User repository getAll', () {
    test(
        'should return responseSuccess when the call to remote data source is success',
        () async {
      //arrange
      when(remoteDataSourceImpl.getAll(parameterQuery))
          .thenAnswer((_) async => <UserEntity>[]);
      //act
      var results = await repository.getAll(parameterQuery);
      //assert
      expect(results, isA<ResponseSuccess<List<UserEntity>>>());
    });

    test(
        'should return responseFailure when the call to remote data source is ApiException',
        () async {
      //arrange
      when(remoteDataSourceImpl.getAll(parameterQuery))
          .thenThrow(ApiException(''));
      //act
      var results = await repository.getAll(parameterQuery);
      //assert
      expect(results, isA<ResponseFailure>());
    });

    test(
        'should return responseFailure when the call to remote data source is FormatException',
        () async {
      //arrange
      when(remoteDataSourceImpl.getAll(parameterQuery))
          .thenThrow(FormatException(''));
      //act
      var results = await repository.getAll(parameterQuery);
      //assert
      expect(results, isA<ResponseFailure>());
    });

    test(
        'should return responseFailure when the call to remote data source is SocketException',
        () async {
      //arrange
      when(remoteDataSourceImpl.getAll(parameterQuery))
          .thenThrow(SocketException(''));
      //act
      var results = await repository.getAll(parameterQuery);
      //assert
      expect(results, isA<ResponseFailure>());
    });

    test(
        'should return responseFailure when the call to remote data source is ClientException',
        () async {
      //arrange
      when(remoteDataSourceImpl.getAll(parameterQuery))
          .thenThrow(ClientException(''));
      //act
      var results = await repository.getAll(parameterQuery);
      //assert
      expect(results, isA<ResponseFailure>());
    });

    test(
        'should return responseFailure when the call to remote data source is HandshakeException',
        () async {
      //arrange
      when(remoteDataSourceImpl.getAll(parameterQuery))
          .thenThrow(HandshakeException(''));
      //act
      var results = await repository.getAll(parameterQuery);
      //assert
      expect(results, isA<ResponseFailure>());
    });

    test(
        'should return responseFailure when the call to remote data source is DecodedException',
        () async {
      //arrange
      when(remoteDataSourceImpl.getAll(parameterQuery))
          .thenThrow(DecodedException());
      //act
      var results = await repository.getAll(parameterQuery);
      //assert
      expect(results, isA<ResponseFailure>());
    });

    test(
        'should return responseFailure when call to remote data source is Exception',
        () async {
      //arrange
      when(remoteDataSourceImpl.getAll(parameterQuery)).thenThrow(Exception());
      //act
      var results = await repository.getAll(parameterQuery);
      //assert
      expect(results, isA<ResponseFailure>());
    });
  });
}
