import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app_main.dart';
import 'src/core/certificate/cert.dart';
import 'src/locator.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('appStarted ${DateTime.now()}');

  // config http accept invalid certificate
  HttpOverrides.global = MyHttpOverrides();

  //starting dependency injection.
  await di.initiateDependencies();

  // block rotation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //crashlytics
  //FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  //hack wait runApp, problem viewPort dimension android, line
  //455 page_view.dart, related versions  Flutter >= 3.0.5
  await Future.delayed(const Duration(milliseconds: 500));

  debugPrint('AppInitiate ${DateTime.now()}');

  //zone guard capture exception and stacktrace
  runZonedGuarded(() async {
    if (kDebugMode) {
     // Bloc.observer = SimpleBlocObserver();
    }
    runApp(const MyApp());
  }, (exception, stackTrace) async {
    // crashlytics
    // sentry
  });
}
