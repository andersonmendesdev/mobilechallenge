import 'dart:io';

//override httpClient bad certificante and numer connection host
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..maxConnectionsPerHost = 2
      ..connectionTimeout = const Duration(seconds: 30)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
