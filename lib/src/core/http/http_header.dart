class HTTPHeader {
  final String userAgent;

  const HTTPHeader({required this.userAgent});

  ///[headerGetNoAuth] GET not authenticated
  Map<String, String> headerGetNoAuth() => <String, String>{
        'User-agent': userAgent,
        'Accept': 'application/json',
      };

}
