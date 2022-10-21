class ServeException implements Exception {}

class ApiException implements Exception {
  final String message;

  ApiException(this.message);
  @override
  String toString() {
    return message;
  }

}

class ExpiredException implements Exception {
  final String message;
  ExpiredException({this.message = 'Sua sessão expirou!'});
  @override
  String toString() {
    return message;
  }
}

// class CacheException implements Exception {}

// class UTF8Exception implements Exception {}

class DecodedException implements Exception {}

class LocalExpcetion implements Exception {
  final String message;
  LocalExpcetion(this.message);
  @override
  String toString() {
    return message;
  }
}
