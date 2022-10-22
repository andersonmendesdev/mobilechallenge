import 'package:flutter/material.dart';

class SwitcherAnimateWidget extends StatelessWidget {
  const SwitcherAnimateWidget(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 250)})
      : super(key: key);

  final Widget child;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      child: child,
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          //alignment: Alignment.center,

          children: <Widget>[
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
    );
  }
}
