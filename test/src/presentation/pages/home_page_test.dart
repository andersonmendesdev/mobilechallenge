import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mobilechallenge/src/core/export.dart';
import 'package:mobilechallenge/src/domain/entities/user_entity.dart';
import 'package:mobilechallenge/src/presentation/bloc/users_bloc.dart';
import 'package:mobilechallenge/src/presentation/pages/home/home_page.dart';
import 'package:mobilechallenge/src/presentation/pages/home/widget/card_user_widget.dart';
import 'package:mobilechallenge/src/presentation/pages/home/widget/search_field_widget.dart';
import 'package:mobilechallenge/src/presentation/pages/widget/loading/schimmer_card_list.dart';
import 'package:mocktail/mocktail.dart';

import '../bloc/users_bloc_test.mocks.dart';

class MockUsersBloc extends MockBloc<UsersEvent, UsersState>
    implements UsersBloc {}

class MockHttpRequestParameters extends Mock implements HttpRequestParameters {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW
  late MockHttpRequestParameters params;
  late MockGetAllUsersUsecase getAllUsersUsecase;
  late UsersBloc usersBloc;
  late List<UserEntity> mockingList;
  late List<UserEntity> mockingListAuxi;
  late UsersState usersState;
  late ResponseSuccess<List<UserEntity>> responseSucess;
  late ResponseFailure<List<UserEntity>> responseFailure;

  setUp(() {
    params = MockHttpRequestParameters();
    getAllUsersUsecase = MockGetAllUsersUsecase();
    usersBloc = MockUsersBloc();
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
      UserEntity(
          id: UserId(name: 'SSN', value: '113-42-0860'),
          gender: 'male',
          email: 'beverley.pierce@example.com',
          phone: '(270) 300-6062',
          name: UserName(title: 'Mrs', first: 'Maicon', last: 'Sierra'),
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
      UserEntity(
          id: UserId(name: 'SSN', value: '113-42-0860'),
          gender: 'male',
          email: 'beverley.pierce@example.com',
          phone: '(270) 300-6062',
          name: UserName(title: 'Mrs', first: 'Maicon', last: 'Sierra'),
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
    responseSucess = ResponseSuccess(mockingList);
    responseFailure = ResponseFailure('Error Message');
    usersState = UsersState.initial().copyWith(
      listAllUserSearch: mockingList,
      listAllUser: mockingListAuxi,
      statusGetAll: StatusEnum.initial,
    );
  });

  group('Home Page', () {
    testWidgets('Home mounted page', (tester) async {
      when(() => usersBloc.state).thenReturn(usersState);

      await tester.pumpWidget(
        MaterialApp(
            home: BlocProvider.value(
          value: usersBloc,
          child: const HomePage(),
        )),
      );

      //await tester.pumpAndSettle();

      expect(find.byType(SearchFieldWidget), findsOneWidget);
    });

    testWidgets('Home page find SchimmerCards', (tester) async {
      when(() => usersBloc.state).thenReturn(UsersState.initial());

      await tester.pumpWidget(
        MaterialApp(
            home: BlocProvider.value(
          value: usersBloc,
          child: const HomePage(),
        )),
      );
      //await tester.tap(find.byKey(Key(TypeFilterEnum.gender.toString())));

      //await tester.pumpAndSettle();

      expect(find.byType(SchimmerCards), findsOneWidget);
      //expect(find.byType(ModalSheetFilter), findsOneWidget);
    });

    testWidgets('Home page find CardsItens', (tester) async {
      when(() => usersBloc.state).thenReturn(usersState);

      await tester.pumpWidget(
        MaterialApp(
            home: BlocProvider.value(
          value: usersBloc,
          child: const HomePage(),
        )),
      );

      //await tester.tap(find.byKey(Key(TypeFilterEnum.gender.toString())));

      //await tester.pumpAndSettle();

      expect(find.byType(CardUserWidget), findsNWidgets(2));
      //expect(find.byType(ModalSheetFilter), findsOneWidget);
    });

    testWidgets('Home page test listener', (tester) async {
      // when(() =>getAllUsersUsecase(params)).thenAnswer((_) async => responseSucess);
      when(() => usersBloc.state).thenReturn(UsersState.initial());

      whenListen(
          usersBloc,
          Stream.fromIterable([
            usersState.copyWith(statusGetAll: StatusEnum.loading),
            usersState.copyWith(
                statusGetAll: StatusEnum.initial,
                listAllUser: mockingList,
                listAllUserSearch: mockingListAuxi),
          ]));

      await tester.pumpWidget(
        MaterialApp(
            home: BlocProvider<UsersBloc>(
          create: (context) => usersBloc,
          child: const HomePage(),
        )),
      );

      expect(find.byType(SchimmerCards), findsOneWidget);
      await tester.pump();

      expect(find.byType(CardUserWidget), findsNWidgets(2));
    });

    // testWidgets('Home page test listener error message', (tester) async {
    //   // when(() =>getAllUsersUsecase(params)).thenAnswer((_) async => responseSucess);
    //   when(() => usersBloc.state).thenReturn(UsersState.initial());
    //
    //   whenListen(
    //       usersBloc,
    //       Stream.fromIterable([
    //         usersState.copyWith(statusGetAll: StatusEnum.loading),
    //         usersState.copyWith(
    //             statusGetAll: StatusEnum.failure,
    //             errorMessage: 'Error Message'),
    //       ]));
    //
    //   await tester.pumpWidget(
    //     MaterialApp(
    //       home: BlocProvider<UsersBloc>(
    //         create: (context) => usersBloc,
    //         child: const HomePage(),
    //       ),
    //       //onGenerateRoute: router.generateRoutes,
    //     ),
    //   );
    //   expect(find.byType(SchimmerCards), findsOneWidget);
    //   await tester.pump();
    //   expect(
    //       find.byKey(const Key('pageErrorEmptyStateWidget')), findsOneWidget);
    // });
  });
}
