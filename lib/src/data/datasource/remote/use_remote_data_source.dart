

import '../../../core/export.dart';
import '../../../domain/entities/user_entity.dart';

abstract class UserRemoteDataSource {
  /// get users
  Future<List<UserEntity>> getAll(HttpRequestParameters params);
}