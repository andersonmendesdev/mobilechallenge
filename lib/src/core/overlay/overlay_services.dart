// ignore_for_file: cascade_invocations

import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'snackbar_widget.dart';

enum TypeSnackBar {
  success,
  successPush,
  alertScreen,
  //alert,
  errorScreen,
  alertSpan,
  alertLarge,
}

class OverlayEntryServices {
  late BuildContext context;
  OverlayState? overlayState;
  var initiateOverlay = false;
  var queueOverlays = Queue<OverlayEntry>();

  ///[show] Option to open overlayentry.
  ///  #typed
  ///  *  Success
  ///  *  SuccessPush
  ///  *  AlertScreen
  ///  *  Alert
  ///  *  ErrorScreen
  ///  *  AlertSpan
  ///  *  AlertLarge

  void show({
    bool ignoredPointer = true,
    Duration duration = const Duration(seconds: 2),
    required String message,
    List<TextSpan> spanList = const <TextSpan>[],
    required TypeSnackBar typed,
  }) async {
    overlayState = Overlay.of(context);
    var overlayEntry = OverlayEntry(
      builder: (BuildContext context) => SnackBarWidget(
        message: message,
        typed: typed,
        ignoredpointer: ignoredPointer,
        duration: duration,
        spanList: spanList,
        listener: _onRemoveOverlay,
      ),
    );
    queueOverlays.addFirst(overlayEntry);
    if (!initiateOverlay) {
      initiateOverlay = true;
      _insertOverlayInState();
    }
  }

  void _onRemoveOverlay() {
    if (kDebugMode) {
      print('_onRemoveOverlay');
    }
    if (queueOverlays.isNotEmpty) {
      var overlay = queueOverlays.last;
      overlay.remove();
    }
    if (queueOverlays.isNotEmpty) {
      queueOverlays.removeLast();
    }
    if (queueOverlays.isNotEmpty) {
      _insertOverlayInState();
    } else {
      initiateOverlay = false;
    }
  }

  void _insertOverlayInState() {
    overlayState?.insert(queueOverlays.last);
  }

  void initiateContext(BuildContext context) {
    this.context = context;
  }
}
