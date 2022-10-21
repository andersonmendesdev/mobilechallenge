import 'package:flutter_test/flutter_test.dart';
import 'package:mobilechallenge/src/core/export.dart';
import 'package:mobilechallenge/src/domain/entities/user_entity.dart';
import 'package:mobilechallenge/src/domain/repositories/user_repository.dart';
import 'package:mobilechallenge/src/domain/usecases/usecase_get_users.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'usecase_get_users_test.mocks.dart';

@GenerateNiceMocks([MockSpec<UserRepository>()])
void main() {

  late MockUserRepository repository;
  late GetAllUsersUsecase usecase;
  const header = HTTPHeader(userAgent:'');
  final parameter = HttpRequestParameters(
      uri: 'randomuser.me',
      paths: '/api',
      header: header.headerGetNoAuth(),
      method: HTTPMethodEnum.get);

  setUp(() {
    repository = MockUserRepository();
    usecase = GetAllUsersUsecase(repository: repository);
  });

  test('Should return a ResponseSuccess of type List<UserEntity>',
      () async {
    when(repository.getAll(parameter))
        .thenAnswer((_) async => ResponseSuccess(<UserEntity>[]));
    var result = await usecase(parameter);
    expect(result, isA<ResponseSuccess<List<UserEntity>>>());
  });
}
