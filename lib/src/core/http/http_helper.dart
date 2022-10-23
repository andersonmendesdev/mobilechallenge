// ignore_for_file: dead_code

import 'dart:convert';
import 'package:http/http.dart';

import 'http_request_parameters.dart';

class HTTPHelper {
  final Encoding? _encoding;
  final Client _httpClient;

  HTTPHelper({required Encoding? encoding, required Client httpClient})
      : _encoding = encoding,
        _httpClient = httpClient;


  Future<dynamic> jsonDecod(String decodedutf8) async {
    var decodedjson = json.decode(decodedutf8);
    return decodedjson;
  }

  Future<Response> getClientHttp(HttpRequestParameters params) async {
    var uri = await getURi(params);
    switch (params.method) {
      case HTTPMethodEnum.get:
        return _httpClient.get(uri, headers: params.header);
      case HTTPMethodEnum.post:
        return _httpClient.post(uri,
            body: params.isJsonBody ? json.encode(params.body) : params.body,
            headers: params.header,
            encoding: _encoding);
      case HTTPMethodEnum.delete:
        return _httpClient.delete(uri, headers: params.header);
      default:
        return _httpClient.get(uri, headers: params.header);
    }
  }

  Future<Uri> getURi(HttpRequestParameters params) async {
    var uri =  Uri.https(params.uri, params.paths);
    if (params.queryParams.isNotEmpty) {
      if (params.isEncodedURI) {
        uri = Uri.https(params.uri, params.paths, params.queryParams);
        return uri;
      }
      var urihttp = Uri.https(params.uri, params.paths, params.queryParams);
      var uriString = Uri.decodeFull(urihttp.toString());
      uri = Uri.parse(uriString);
      return uri;
    }
    return uri;
  }
}
