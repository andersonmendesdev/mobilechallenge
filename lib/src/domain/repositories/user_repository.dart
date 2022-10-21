import '../../core/http/http_request_parameters.dart';
import '../../core/http/http_response_data.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {
  /// get users
  Future<ResponseData<List<UserEntity>>> getAll(HttpRequestParameters params);
}