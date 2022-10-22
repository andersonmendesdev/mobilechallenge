import 'dart:io';

import 'package:http/http.dart';

import '../../core/export.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasource/remote/use_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl({required UserRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<ResponseData<List<UserEntity>>> getAll(
      HttpRequestParameters params) async {
    try {
      var result = await _remoteDataSource.getAll(params);
      return ResponseSuccess(result);
    } on ApiException catch (e) {
      return ResponseFailure(e.message);
    } on FormatException {
      return ResponseFailure(formatExeption);
    } on SocketException {
      return ResponseFailure(socketExceptionMessage);
    } on ClientException {
      return ResponseFailure(clientExceptionMessage);
    } on HandshakeException {
      return ResponseFailure(handshakeExceptionMessage);
    } on DecodedException {
      return ResponseFailure(exceptionMessage);
    } catch (e) {
      return ResponseFailure(e.toString());
    }
  }
}
