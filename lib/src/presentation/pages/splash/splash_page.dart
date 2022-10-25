

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../route/app_routes.dart';
import '../widget/logo/logo_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _onNextPage();
    super.initState();
  }

  void _onNextPage() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (mounted) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.white;
    print(defaultTargetPlatform);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(
            backgroundColor: primaryColor,
            elevation: 0,
          ),
        ),
        backgroundColor: primaryColor,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  LogoWidget(width: 150),
                  SizedBox(height: 20),
                  BuilderLoading(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class BuilderLoading extends StatelessWidget {
  const BuilderLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch(defaultTargetPlatform){
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return     const CircularProgressIndicator(
            valueColor:
            AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 4.0);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return const CupertinoTheme(
            data:
            CupertinoThemeData(brightness: Brightness.light),
            child: CupertinoActivityIndicator(radius: 15));


    }
  }
}
