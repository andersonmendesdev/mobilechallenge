import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'presentation/bloc/users_bloc.dart';
import 'presentation/route/app_builder.dart' as routes;
import 'presentation/route/app_routes.dart';
import 'presentation/theme/input_decoration_theme.dart';
import 'presentation/theme/palette.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.bloc}) : super(key: key);

  final UsersBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: MaterialApp(
        title: 'My Users',
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        routes: routes.getRoutes(),
        onGenerateRoute: routes.generateRoutes,
        theme: ThemeData(
          primarySwatch: ColorPalette.color003461,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: ColorPalette.colorWhitSmoke,
          iconTheme:
              const IconThemeData(color: Colors.grey, size: 20, opacity: 1),
          inputDecorationTheme: InputDecorationThemeCustom.theme(ColorPalette.color003461),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('pt'),
        ],
      ),
    );
  }
}
