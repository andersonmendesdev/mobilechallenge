// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

import '../../presentation/theme/palette.dart';
import 'overlay_services.dart';

part 'snackbar_content_widget.dart';

class SnackBarWidget extends StatefulWidget {
  const SnackBarWidget(
      {Key? key,
      //required this.widget,
      required this.ignoredpointer,
      required this.listener,
      required this.duration,
      required this.message,
      required this.typed,
      this.spanList = const <TextSpan>[]})
      : super(key: key);

  //final Widget widget;
  ///[ignoredpointer] ignore touchclick
  final bool ignoredpointer;

  ///[listener] listener to close overlay and remove.
  final Function listener;

  ///[duration] duration overlay in screen and auto closed.
  final Duration duration;

  ///[message] simple message string.
  final String message;

  ///[typed] Option to open overlayentry.
  ///  *  Success
  ///  *  SuccessPush
  ///  *  AlertScreen
  ///  *  Alert
  ///  *  ErrorScreen
  ///  *  AlertSpan
  ///  *  AlertLarge
  final TypeSnackBar typed;

  ///[spanList] list textspan message
  final List<TextSpan> spanList;

  @override
  _SnackBarCustomState createState() => _SnackBarCustomState();
}

class _SnackBarCustomState extends State<SnackBarWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationPrimary;

  //late AnimationController _animationProgressBar;
  late Timer timer;
  var _isRevese = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);

    // _animationProgressBar =
    //     AnimationController(duration: widget.duration, vsync: this)
    //       ..addListener(() {
    //         setState(() {});
    //       });

    _animationPrimary = Tween<double>(begin: 20, end: 60.0).animate(
        CurvedAnimation(
            parent: _animationController, curve: Curves.fastOutSlowIn))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          widget.listener();
        }
      });
    _animationController.forward();
    //_animationProgressBar.forward();
    _incrementTimer();
  }

  void _incrementTimer() {
    timer = Timer(widget.duration, () {
      if (mounted) {
        _onRever();
      }
    });
  }

  void _onRever() {
    if (_isRevese) return;
    _isRevese = true;
    _animationController.reverse();
  }

  @override
  void dispose() {
    _animationController
      ..removeListener(() {})
      ..removeStatusListener((status) {})
      ..dispose();
    //_animationProgressBar.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final snackContent = GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dy < 0) {
          _onRever();
        }
      },
      child: SnackbarContentWidget(
        message: widget.message,
        typed: widget.typed,
        animationController: _animationController,
        spanList: widget.spanList,
        //animationBar: _animationProgressBar.value,
      ),
    );
    return widget.ignoredpointer
        ? Positioned(
            top: _animationPrimary.value, //42,
            left: 0,
            child: IgnorePointer(
                child: Material(
                    color: Colors.transparent,
                    child: FadeTransition(
                        opacity: _animationController, child: snackContent))))
        : Positioned(
            top: _animationPrimary.value, //46,
            left: 0,
            child: Material(
                color: Colors.transparent,
                child: FadeTransition(
                    opacity: _animationController, child: snackContent)));
  }
}
