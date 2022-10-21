import '../../core/http/http_request_parameters.dart';
import '../../core/http/http_response_data.dart';
import '../../core/usecases/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetAllUsersUsecase
    implements UseCase<ResponseData<List<UserEntity>>, HttpRequestParameters> {
  final UserRepository _repository;

  const GetAllUsersUsecase({required UserRepository repository})
      : _repository = repository;

  @override
  Future<ResponseData<List<UserEntity>>> call(HttpRequestParameters params) {
    return _repository.getAll(params);
  }
}
