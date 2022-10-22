import 'package:flutter/foundation.dart';

import '../../../core/export.dart';
import '../../../domain/entities/user_entity.dart';
import '../../model/model_user.dart';
import 'use_remote_data_source.dart';

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final HTTPHelper _httpHelper;

  UserRemoteDataSourceImpl({required HTTPHelper httpHelper})
      : _httpHelper = httpHelper;

  @override
  Future<List<UserEntity>> getAll(HttpRequestParameters params) async {
    var response = await _httpHelper.getClientHttp(params);
    debugPrint('${response.statusCode}::${response.request?.url ?? ''}');
    switch (response.statusCode) {
      case 200:
        var jsonString = await _httpHelper.utfdecode(response.bodyBytes);
        var jsonData = await _httpHelper.jsonDecod(jsonString);
        var message = jsonData['error'];
        if (message is String) {
          throw ApiException(message);
        }
        var results = jsonData['results'];
        if (results is List) {
          var userList = <UserEntity>[];
          for(var item in results){
            if(item is Map){
              userList.add(ModelUser.fromJson(item));
            }
          }
          return userList;
        }
        throw ApiException(exceptionMessageGen);
      default:
        var jsonString = await _httpHelper.utfdecode(response.bodyBytes);
        var jsonData = await _httpHelper.jsonDecod(jsonString);
        var message = jsonData['error'];
        if (message is String) {
          throw ApiException(message);
        }
        throw ApiException(exceptionMessageGen);
    }
  }
}
