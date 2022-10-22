// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:fk_user_agent/fk_user_agent.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'core/http/http_header.dart';
import 'core/http/http_helper.dart';
import 'data/datasource/remote/use_remote_data_source.dart';
import 'data/datasource/remote/user_remote_data_source_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/usecase_get_users.dart';
import 'presentation/bloc/users_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> initiateDependencies() async {
  var packageInfo = await PackageInfo.fromPlatform();
  var encoding = Encoding.getByName('utf-8');
  var apiURI = 'randomuser.me';
  var apiVersion = '1.4';
  var userAgent = '';
  try {
    userAgent = await FkUserAgent.getPropertyAsync('userAgent') ?? '';
  } catch (_) {}
  //
  if (kDebugMode) {
    await dotenv.load();
    var path = dotenv.env['PATH'] ?? '';
    if (path.isNotEmpty) {
      apiURI = path;
    }
  }
  //bloc
  debugPrint('uri: $apiURI');
  locator
    ..registerLazySingleton<UsersBloc>(() => UsersBloc(
        allUsersUsecase: locator(),
        apiURI: apiURI,
        httpHeader: locator(),
        apiVersion: apiVersion))
    ..registerLazySingleton<GetAllUsersUsecase>(
        () => GetAllUsersUsecase(repository: locator()))
    ..registerLazySingleton<UserRepository>(
        () => UserRepositoryImpl(remoteDataSource: locator()))
    ..registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImpl(httpHelper: locator()))
    ..registerLazySingleton<HTTPHelper>(
        () => HTTPHelper(encoding: encoding, httpClient: locator()))
    ..registerLazySingleton<HTTPHeader>(() => HTTPHeader(userAgent: userAgent))
    ..registerLazySingleton<Client>(Client.new)
    ..registerLazySingleton<DeviceInfoPlugin>(DeviceInfoPlugin.new);
}
