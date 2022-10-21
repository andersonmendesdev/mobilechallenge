import 'package:flutter/material.dart';

enum TypeAnimationPage {
  fade,
  scale,
  scaleFade,
  fadeScale,
  slideTop,
  slideBottom,
  slideRight,
  slideLeft,
}

Widget buildMaterialTransitions({
  required BuildContext context,
  required Animation<double> animation,
  required Animation<double> secondaryAnimation,
  required TypeAnimationPage typeAnimation,
  required Widget child,
  Curve curves = Curves.ease,
}) {
  switch (typeAnimation) {
    case TypeAnimationPage.fade:
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    case TypeAnimationPage.scale:
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: curves,
        ),
        child: child,
      );

    case TypeAnimationPage.fadeScale:
      return FadeTransition(
        opacity: animation,
        child: ScaleTransition(
          scale: animation,
          child: child,
        ),
      );
    case TypeAnimationPage.slideTop:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curves,
        )),
        child: child,
      );

    case TypeAnimationPage.slideBottom:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curves,
        )),
        child: child,
      );
    case TypeAnimationPage.slideLeft:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curves,
        )),
        child: child,
      );
    case TypeAnimationPage.slideRight:
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(-1, 0),
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curves,
        )),
        child: child,
      );
    default:
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: CurvedAnimation(
            parent: animation,
            curve: curves,
          ),
          curve: curves,
        ),
        child: child,
      );
  }
}
