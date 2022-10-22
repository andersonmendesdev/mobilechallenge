// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mobilechallenge/src/app_main.dart';
import 'package:mobilechallenge/src/presentation/bloc/users_bloc.dart';
import 'package:mocktail/mocktail.dart' as mocktail;

class MockUsersBloc extends MockBloc<UsersEvent, UsersState>
    implements UsersBloc {}

class FakeMyState extends Fake implements UsersState {}
class FakeMyEvent extends Fake implements UsersEvent {}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  mocktail.registerFallbackValue(FakeMyState());
  mocktail.registerFallbackValue(FakeMyEvent());
  late MockUsersBloc usersBloc;
  late UsersState usersState;
  setUp(() {
    usersBloc = MockUsersBloc();
    usersState = UsersState.initial();
  });
  testWidgets('should render page', (widgetTester) async {
    mocktail.when(() => usersBloc.state).thenReturn(usersState);
    final emptyStateWidget = find.byType(Scaffold);
    await widgetTester.pumpWidget(MyApp(bloc: usersBloc));
    await widgetTester.pumpAndSettle();
    expect(emptyStateWidget, findsOneWidget);
  });
}
