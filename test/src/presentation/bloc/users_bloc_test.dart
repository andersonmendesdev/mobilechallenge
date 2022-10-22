// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:mobilechallenge/src/core/enum/enum_filter.dart';
import 'package:mobilechallenge/src/core/export.dart';

import 'package:mobilechallenge/src/domain/entities/user_entity.dart';
import 'package:mobilechallenge/src/domain/usecases/usecase_get_users.dart';
import 'package:mobilechallenge/src/presentation/bloc/users_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../core/http/http_header_test.mocks.dart';
import 'users_bloc_test.mocks.dart';

@GenerateNiceMocks([MockSpec<GetAllUsersUsecase>()])
void main() {
  late MockHTTPHeader httpHeader;
  late MockGetAllUsersUsecase getAllUsersUsecase;
  late UsersBloc usersBloc;
  const apiURI = 'randomuser.me';
  const apiVersion = '1.4';
  late List<UserEntity> mockingList;
  late List<UserEntity> mockingListAuxi;
  late UsersState userState;

  late ResponseSuccess<List<UserEntity>> responseSucess;
  late ResponseFailure<List<UserEntity>> responseFailure;

  setUp(() {
    getAllUsersUsecase = MockGetAllUsersUsecase();
    httpHeader = MockHTTPHeader();
    mockingList = <UserEntity>[
      UserEntity(
          id: UserId(name: 'SSN', value: '113-42-0860'),
          gender: 'female',
          email: 'beverley.pierce@example.com',
          phone: '(270) 300-6062',
          name: UserName(title: 'Mrs', first: 'Beverley', last: 'Pierce'),
          dob: UserDob(date: DateTime(1988, 2, 2), age: 40),
          picture: UserPicture(
              large: 'https://randomuser.me/api/portraits/women/93.jpg',
              medium: 'https://randomuser.me/api/portraits/med/women/93.jpg',
              thumbnail:
                  'https://randomuser.me/api/portraits/thumb/women/93.jpg'),
          nat: 'US',
          location: UserLocation(
              address: 'N Stelling Rd',
              number: 9102,
              city: 'Irvine',
              state: 'Wyoming',
              country: 'United States',
              postcode: 59221)),
    ];
    mockingListAuxi = <UserEntity>[
      UserEntity(
          id: UserId(name: 'SSN', value: '113-42-0860'),
          gender: 'female',
          email: 'beverley.pierce@example.com',
          phone: '(270) 300-6062',
          name: UserName(title: 'Mrs', first: 'Beverley', last: 'Pierce'),
          dob: UserDob(date: DateTime(1988, 2, 2), age: 40),
          picture: UserPicture(
              large: 'https://randomuser.me/api/portraits/women/93.jpg',
              medium: 'https://randomuser.me/api/portraits/med/women/93.jpg',
              thumbnail:
                  'https://randomuser.me/api/portraits/thumb/women/93.jpg'),
          nat: 'US',
          location: UserLocation(
              address: 'N Stelling Rd',
              number: 9102,
              city: 'Irvine',
              state: 'Wyoming',
              country: 'United States',
              postcode: 59221)),
    ];
    userState = UsersState.initial();
    responseSucess = ResponseSuccess(mockingList);
    responseFailure = ResponseFailure('Error Message');
    usersBloc = UsersBloc(
        allUsersUsecase: getAllUsersUsecase,
        apiURI: apiURI,
        apiVersion: apiVersion,
        httpHeader: httpHeader);
  });

  tearDown(() {
    usersBloc.close();
  });

  group('Get all Users', () {
    test('should initial state equals is UsersState', () async {
      expect(usersBloc.state, equals(userState));
    });

    test(
        'should emit the correct state sequence when getAllUsers and return ResponseSucess',
        () async {
      //arrange
      when(getAllUsersUsecase(any)).thenAnswer((_) async => responseSucess);
      //act
      usersBloc.add(GetAllUserEvent());
      //assert
      expect(
          usersBloc.stream,
          emitsInOrder([
            userState.copyWith(statusGetAll: StatusEnum.loading),
            userState.copyWith(
                statusGetAll: StatusEnum.initial,
                listAllUser: mockingList,
                listAllUserSearch: mockingList),
          ]));
    });

    test(
        'should emit the correct state sequence when getAllUsers and return ResponseFailure',
        () async {
      //arrange
      when(getAllUsersUsecase(any)).thenAnswer((_) async => responseFailure);
      //act
      usersBloc.add(GetAllUserEvent());
      //assert
      expect(
          usersBloc.stream,
          emitsInOrder([
            userState.copyWith(statusGetAll: StatusEnum.loading),
            userState.copyWith(
                statusGetAll: StatusEnum.failure,
                errorMessage: 'Error Message'),
          ]));
    });

    test(
        '''should emit correct state string when getAllUsers is called with query nat and gender and return ResponseSucess''',
        () async {
      //arrange
      when(getAllUsersUsecase(any)).thenAnswer((_) async => responseSucess);
      //act
      usersBloc.add(GetAllUserEvent(
          filterNat: FilterNatEnum.BR, filterGender: FilterGenderEnum.female));
      //assert
      expect(
          usersBloc.stream,
          emitsInOrder([
            userState.copyWith(
              statusGetAll: StatusEnum.loading,
              filterGender: FilterGenderEnum.female,
              filterNat: FilterNatEnum.BR,
            ),
            userState.copyWith(
                statusGetAll: StatusEnum.initial,
                listAllUser: mockingList,
                filterGender: FilterGenderEnum.female,
                filterNat: FilterNatEnum.BR,
                listAllUserSearch: mockingList),
          ]));
    });

    test(
        '''should emit correct state string when getAllUsers is called with query gender and return ResponseSucess''',
        () async {
      //arrange
      when(getAllUsersUsecase(any)).thenAnswer((_) async => responseSucess);
      //act
      usersBloc.add(GetAllUserEvent(filterGender: FilterGenderEnum.female));
      //assert
      expect(
          usersBloc.stream,
          emitsInOrder([
            userState.copyWith(
              statusGetAll: StatusEnum.loading,
              filterGender: FilterGenderEnum.female,
            ),
            userState.copyWith(
                statusGetAll: StatusEnum.initial,
                listAllUser: mockingList,
                filterGender: FilterGenderEnum.female,
                listAllUserSearch: mockingList),
          ]));
    });
    test(
        '''should emit correct state string when getAllUsers is called with query nat and return ResponseSucess''',
        () async {
      //arrange
      when(getAllUsersUsecase(any)).thenAnswer((_) async => responseSucess);
      //act
      usersBloc.add(GetAllUserEvent(filterNat: FilterNatEnum.BR));
      //assert
      expect(
          usersBloc.stream,
          emitsInOrder([
            userState.copyWith(
              statusGetAll: StatusEnum.loading,
              filterNat: FilterNatEnum.BR,
            ),
            userState.copyWith(
                statusGetAll: StatusEnum.initial,
                listAllUser: mockingList,
                filterNat: FilterNatEnum.BR,
                listAllUserSearch: mockingList),
          ]));
    });
  });

  group('Search user', () {
    test('should return users when fetched for a invalid value.', () async {
      usersBloc.add(SearchUserEvent(query: ''));
      expect(usersBloc.stream, emits(userState.copyWith()));
    });

    test('should return previous list when valid search', () async {
      when(getAllUsersUsecase(any)).thenAnswer((_) async => responseSucess);
      //act
      usersBloc
        ..add(GetAllUserEvent(filterNat: FilterNatEnum.BR))
        ..add(SearchUserEvent(query: 'Beverley'));
      expect(usersBloc.stream, emitsInOrder([
        userState.copyWith(
          statusGetAll: StatusEnum.loading,
          filterNat: FilterNatEnum.BR,
        ),
        userState.copyWith(
            statusGetAll: StatusEnum.initial,
            listAllUser: mockingList,
            filterNat: FilterNatEnum.BR,
            listAllUserSearch: mockingList),

      ]));
    });

    test('should return previous list when clearing search', () async {
      when(getAllUsersUsecase(any)).thenAnswer((_) async => responseSucess);
      //act
      usersBloc
        ..add(GetAllUserEvent(filterNat: FilterNatEnum.BR))
        ..add(SearchUserClearEvent());
      expect(usersBloc.stream, emitsInOrder([
        userState.copyWith(
          statusGetAll: StatusEnum.loading,
          filterNat: FilterNatEnum.BR,
        ),
        userState.copyWith(
            statusGetAll: StatusEnum.initial,
            listAllUser: mockingList,
            filterNat: FilterNatEnum.BR,
            listAllUserSearch: mockingList),

      ]));
    });
  });
}
