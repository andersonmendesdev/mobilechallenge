import 'package:flutter/material.dart';

import '../../route/dialog/custom_dialog.dart';

class ModalPopupError extends StatelessWidget {
  final RouteSettings settings;
  const ModalPopupError(this.settings, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var message = 'Default error';
    var arguments = settings.arguments;
    if (arguments is String) {
      message = arguments;
    }

    return DialogCustom(
      child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Ops',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 17)),
                const SizedBox(height: 15),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: const TextStyle(color: Colors.black54, fontSize: 16),
                        children: <TextSpan>[
                          TextSpan(text: message),
                        ])),
                const SizedBox(height: 15),
                MaterialButton(
                  shape: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black54)),
                  child: const Text('Ok', style: TextStyle(color: Colors.black54)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ])),
    );
  }
}

class ModalError extends StatelessWidget {
  final String message;
   const ModalError({Key? key, required this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Ops',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 17)),
            const SizedBox(height: 15),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: const TextStyle(color: Colors.black54, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(text: message),
                    ])),
            const SizedBox(height: 15),
            MaterialButton(
              shape: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54)),
              child: const Text('Ok', style: TextStyle(color: Colors.black54)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]),
    );
  }
}
