// ignore_for_file: cascade_invocations

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
import 'core/overlay/overlay_services.dart';
import 'presentation/bloc/users_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> initiateDependencies() async {
  var packageInfo = await PackageInfo.fromPlatform();
  var encoding = Encoding.getByName('utf-8');
  var useragent = '';
  var apiURI = 'nfcontrole-dev.us-east-1.elasticbeanstalk.com';
  try {
    useragent = await FkUserAgent.getPropertyAsync('userAgent') ?? '';
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
  locator.registerLazySingleton<UsersBloc>(UsersBloc.new);

  locator
    ..registerLazySingleton<HTTPHelper>(
        () => HTTPHelper(encoding: encoding, httpClient: locator()))
    ..registerLazySingleton<HTTPHeader>(() => HTTPHeader(userAgent: useragent))
    ..registerLazySingleton<Client>(Client.new)
    ..registerLazySingleton<DeviceInfoPlugin>(DeviceInfoPlugin.new)
    ..registerLazySingleton<OverlayEntryServices>(OverlayEntryServices.new);
}
