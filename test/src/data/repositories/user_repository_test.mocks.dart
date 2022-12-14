// Mocks generated by Mockito 5.3.2 from annotations
// in mobilechallenge/test/src/data/repositories/user_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mobilechallenge/src/core/export.dart' as _i5;
import 'package:mobilechallenge/src/data/datasource/remote/user_remote_data_source_impl.dart'
    as _i2;
import 'package:mobilechallenge/src/domain/entities/user_entity.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [UserRemoteDataSourceImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRemoteDataSourceImpl extends _i1.Mock
    implements _i2.UserRemoteDataSourceImpl {
  @override
  _i3.Future<List<_i4.UserEntity>> getAll(_i5.HttpRequestParameters? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [params],
        ),
        returnValue: _i3.Future<List<_i4.UserEntity>>.value(<_i4.UserEntity>[]),
        returnValueForMissingStub:
            _i3.Future<List<_i4.UserEntity>>.value(<_i4.UserEntity>[]),
      ) as _i3.Future<List<_i4.UserEntity>>);
}
