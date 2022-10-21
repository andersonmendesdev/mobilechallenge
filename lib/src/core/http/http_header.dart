class HTTPHeader {
  final String userAgent;

  const HTTPHeader({required this.userAgent});

  ///[headerGet] GET authenticated
  Map<String, String> headerGet(String token) {
    return <String, String>{
      'User-agent': userAgent,
      'Accept': 'application/json; text/plain',
      'Authorization': 'Bearer $token',
    };
  }

  ///[headerGetNull] GET not authenticated
  Map<String, String> get headerGetNull => <String, String>{
        'User-agent': userAgent,
        'Accept': 'application/json',
      };

  ///[headerPost] POST authenticated, [isJson] set the content-type of the post
  Map<String, String> headerPost(String token, {bool isJson = true}) {
    return <String, String>{
      'User-agent': userAgent,
      'Accept': 'application/json; text/plain',
      'Authorization': 'Bearer $token',
      'Content-type': isJson
          ? 'application/json; charset=UTF-8'
          : 'application/x-www-form-urlencoded'
    };
  }

  ///[headerPostNull] POST not authenticated
  Map<String, String> get headerPostNull => <String, String>{
        'User-agent': userAgent,
        'Accept': 'application/json',
        'Content-type': 'application/json; charset=UTF-8',
      };
}
