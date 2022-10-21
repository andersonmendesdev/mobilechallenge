import 'package:flutter/material.dart';
import 'custom_transitions.dart';

// default transition page by material OS type (android and ios)
MaterialPageRoute materialBuilder(
    {required Widget widget, required RouteSettings settings}) {
  return MaterialPageRoute(builder: (context) => widget, settings: settings);
}

///custom transation page by properties [typeAnimation]
PageRouteBuilder pageRouteBuilder({
  required Widget page,
  required RouteSettings settings,
  bool barrierDismissible = true,
  Color? barrierColor,
  bool opaque = false,
  String? barrierLabel,
  Duration transitionDuration = const Duration(milliseconds: 150),
  Duration reverseTransition = const Duration(milliseconds: 150),
  TypeAnimationPage typeAnimation = TypeAnimationPage.fadeScale,
  Curve curves = Curves.easeOut,
  bool maintainState = true,
}) {
  return PageRouteBuilder(
    barrierDismissible: barrierDismissible,
    opaque: opaque,
    settings: settings,
    transitionDuration: transitionDuration,
    reverseTransitionDuration: reverseTransition,
    barrierColor: barrierColor,
    barrierLabel: barrierLabel,
    maintainState: maintainState,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        buildMaterialTransitions(
            context: context,
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            typeAnimation: typeAnimation,
            curves: curves,
            child: child),
  );
}

// PageRouteBuilder pageRouteBuilderSearch({required RouteSettings settings}) {
//   return PageRouteBuilder(
//       settings: settings,
//       opaque: false,
//       transitionDuration: const Duration(milliseconds: 300),
//       reverseTransitionDuration: const Duration(milliseconds: 300),
//       maintainState: false,
//       pageBuilder: (context, animation, secondaryAnimation) =>
//           SearchPage(animation: animation),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//           FadeTransition(
//             opacity: animation,
//             child: child,
//           ));
// }

// PageRouteBuilder pageRouteBuilderInvoiceSearch(
//     {required RouteSettings settings}) {
//   return PageRouteBuilder(
//       settings: settings,
//       opaque: false,
//       transitionDuration: const Duration(milliseconds: 300),
//       reverseTransitionDuration: const Duration(milliseconds: 300),
//       maintainState: false,
//       pageBuilder: (context, animation, secondaryAnimation) =>
//           InvoicePageSearch(animation: animation),
//       transitionsBuilder: (context, animation, secondaryAnimation, child) =>
//           FadeTransition(
//             opacity: animation,
//             child: child,
//           ));
// }
