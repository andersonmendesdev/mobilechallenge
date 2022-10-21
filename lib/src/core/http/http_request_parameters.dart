import 'package:equatable/equatable.dart';

enum HTTPMethodEnum { get, post, delete, patch, put, multipart }

class HttpRequestParameters extends Equatable {
  final String uri;
  final String paths;
  final HTTPMethodEnum method;
  final Object body;
  final Map<String, String> header;
  final Map<String, dynamic> queryParams;
  final String extraParams;
  final bool isEncodedURI;
  final bool isJsonBody;

  const HttpRequestParameters(
      {required this.uri,
      required this.paths,
      required this.header,
      required this.method,
      this.queryParams = const <String, dynamic>{},
      this.body = const <String, String>{},
      this.extraParams = '',
      this.isEncodedURI = true,
      this.isJsonBody = true});

  HttpRequestParameters copyWith({
    String? uri,
    String? paths,
    HTTPMethodEnum? method,
    Object? body,
    Map<String, String>? header,
    Map<String, dynamic>? queryParams,
    String? extraParams,
    bool? isEncodedURI,
    bool? isJsonBody,
  }) {
    return HttpRequestParameters(
      uri: uri ?? this.uri,
      paths: paths ?? this.paths,
      method: method ?? this.method,
      body: body ?? this.body,
      header: header ?? this.header,
      queryParams: queryParams ?? this.queryParams,
      extraParams: extraParams ?? this.extraParams,
      isEncodedURI: isEncodedURI ?? this.isEncodedURI,
      isJsonBody: isJsonBody ?? this.isJsonBody,
    );
  }

  @override
  String toString() {
    return ' uri: $uri,'
        ' paths: $paths,'
        ' method: $method,'
        ' header: $header,'
        ' queryParams: $queryParams,'
        ' body: $body';
  }

  @override
  List<Object?> get props => [
        uri,
        paths,
        method,
        body,
        header,
        queryParams,
        extraParams,
        isEncodedURI,
        isJsonBody,
      ];
}
