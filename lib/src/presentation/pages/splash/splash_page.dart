
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../route/app_routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _onNextPage();
  }

  void _onNextPage() async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if(mounted){
      Navigator.of(context).pushReplacementNamed(AppRoutes.home);
    }
  }
  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.white;

    const laodginiOS = CupertinoTheme(
        data: CupertinoThemeData(brightness: Brightness.light),
        child: CupertinoActivityIndicator(radius: 15));
    const loadginAndroid = CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        strokeWidth: 4.0);
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
                children: <Widget>[
                  const FlutterLogo(size: 150),
                  const SizedBox(height: 20),
                  Platform.isAndroid ? loadginAndroid : laodginiOS,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
