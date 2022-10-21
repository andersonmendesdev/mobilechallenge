import 'package:flutter/material.dart';

import '../pagebuilder/custom_transitions.dart';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/widgets.dart';

// Examples can assume:
// enum Department { treasury, state }
// late BuildContext context;

const EdgeInsets _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

/// A material design dialog.
///
/// This dialog widget does not have any opinion about the contents of the
/// dialog. Rather than using this widget directly, consider using [AlertDialog]
/// or [SimpleDialog], which implement specific kinds of material design
/// dialogs.
///
/// See also:
///
///  * [AlertDialog], for dialogs that have a message and some buttons.
///  * [SimpleDialog], for dialogs that offer a variety of options.
///  * [showDialog], which actually displays the dialog and returns its result.
///  * <https://material.io/design/components/dialogs.html>
class DialogCustom extends StatelessWidget {
  /// Creates a dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  const DialogCustom({
    Key? key,
    this.backgroundColor,
    this.elevation,
    this.insetAnimationDuration = const Duration(milliseconds: 100),
    this.insetAnimationCurve = Curves.decelerate,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.child,
  })  : assert(clipBehavior != null),
        super(key: key);

  /// {@template flutter.material.dialog.backgroundColor}
  /// The background color of the surface of this [DialogCustom].
  ///
  /// This sets the [Material.color] on this [DialogCustom]'s [Material].
  ///
  /// If `null`, [ThemeData.dialogBackgroundColor] is used.
  /// {@endtemplate}
  final Color? backgroundColor;

  /// {@template flutter.material.dialog.elevation}
  /// The z-coordinate of this [DialogCustom].
  ///
  /// If null then [DialogTheme.elevation] is used, and if that's null then the
  /// dialog's elevation is 24.0.
  /// {@endtemplate}
  /// {@macro flutter.material.material.elevation}
  final double? elevation;

  /// {@template flutter.material.dialog.insetAnimationDuration}
  /// The duration of the animation to show when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to 100 milliseconds.
  /// {@endtemplate}
  final Duration insetAnimationDuration;

  /// {@template flutter.material.dialog.insetAnimationCurve}
  /// The curve to use for the animation shown when the system keyboard intrudes
  /// into the space that the dialog is placed in.
  ///
  /// Defaults to [Curves.decelerate].
  /// {@endtemplate}
  final Curve insetAnimationCurve;

  /// {@template flutter.material.dialog.insetPadding}
  /// The amount of padding added to [MediaQueryData.viewInsets] on the outside
  /// of the dialog. This defines the minimum space between the screen's edges
  /// and the dialog.
  ///
  /// Defaults to `EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0)`.
  /// {@endtemplate}
  final EdgeInsets? insetPadding;

  /// {@template flutter.material.dialog.clipBehavior}
  /// Controls how the contents of the dialog are clipped (or not) to the given
  /// [shape].
  ///
  /// See the enum [Clip] for details of all possible options and their common
  /// use cases.
  ///
  /// Defaults to [Clip.none], and must not be null.
  /// {@endtemplate}
  final Clip? clipBehavior;

  /// {@template flutter.material.dialog.shape}
  /// The shape of this dialog's border.
  ///
  /// Defines the dialog's [Material.shape].
  ///
  /// The default shape is a [RoundedRectangleBorder] with a radius of 4.0
  /// {@endtemplate}
  final ShapeBorder? shape;

  /// The widget below this widget in the tree.
  ///
  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  static const RoundedRectangleBorder _defaultDialogShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0)));
  static const double _defaultElevation = 24.0;

  @override
  Widget build(BuildContext context) {
    final dialogTheme = DialogTheme.of(context);
    final effectivePadding =
        MediaQuery.of(context).viewInsets + (insetPadding ?? EdgeInsets.zero);
    return AnimatedPadding(
      padding: effectivePadding,
      duration: insetAnimationDuration,
      curve: insetAnimationCurve,
      child: MediaQuery.removeViewInsets(
        removeLeft: true,
        removeTop: true,
        removeRight: true,
        removeBottom: true,
        context: context,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 280.0),
            child: Material(
              color: backgroundColor ??
                  dialogTheme.backgroundColor ??
                  Theme.of(context).dialogBackgroundColor,
              elevation:
                  elevation ?? dialogTheme.elevation ?? _defaultElevation,
              shape: shape ?? dialogTheme.shape ?? _defaultDialogShape,
              type: MaterialType.card,
              clipBehavior: clipBehavior!,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

// Widget _buildMaterialDialogTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child) {
//   return FadeTransition(
//     opacity: CurvedAnimation(
//       parent: animation,
//       curve: Curves.easeOut,
//     ),
//     child: child,
//   );
// }

// Widget _buildMaterialDialogTransitionsScale(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget child) {
//   return FadeTransition(
//     opacity: animation,
//     child: ScaleTransition(
//       scale: animation,
//       child: child,
//     ),
//   );
// }

/// Displays a Material dialog above the current contents of the app, with
/// Material entrance and exit animations, modal barrier color, and modal
/// barrier behavior (dialog is dismissible with a tap on the barrier).
///
/// This function takes a `builder` which typically builds a [DialogCustom] widget.
/// Content below the dialog is dimmed with a [ModalBarrier]. The widget
/// returned by the `builder` does not share a context with the location that
/// `showDialog` is originally called from. Use a [StatefulBuilder] or a
/// custom [StatefulWidget] if the dialog needs to update dynamically.
///
/// The `child` argument is deprecated, and should be replaced with `builder`.
///
/// The `context` argument is used to look up the [Navigator] and [Theme] for
/// the dialog. It is only used when the method is called. Its corresponding
/// widget can be safely removed from the tree before the dialog is closed.
///
/// The `barrierDismissible` argument is used to indicate whether tapping on the
/// barrier will dismiss the dialog. It is `true` by default and can not be `null`.
///
/// The `barrierColor` argument is used to specify the color of the modal
/// barrier that darkens everything below the dialog. If `null` the default color
/// `Colors.black54` is used.
///
/// The `useSafeArea` argument is used to indicate if the dialog should only
/// display in 'safe' areas of the screen not used by the operating system
/// (see [SafeArea] for more details). It is `true` by default, which means
/// the dialog will not overlap operating system areas. If it is set to `false`
/// the dialog will only be constrained by the screen size. It can not be `null`.
///
/// The `useRootNavigator` argument is used to determine whether to push the
/// dialog to the [Navigator] furthest from or nearest to the given `context`.
/// By default, `useRootNavigator` is `true` and the dialog route created by
/// this method is pushed to the root navigator. It can not be `null`.
///
/// The `routeSettings` argument is passed to [showGeneralDialog],
/// see [RouteSettings] for details.
///
/// If the application has multiple [Navigator] objects, it may be necessary to
/// call `Navigator.of(context, rootNavigator: true).pop(result)` to close the
/// dialog rather than just `Navigator.pop(context, result)`.
///
/// Returns a [Future] that resolves to the value (if any) that was passed to
/// [Navigator.pop] when the dialog was closed.
///
/// ### State Restoration in Dialogs
///
/// Using this method will not enable state restoration for the dialog. In order
/// to enable state restoration for a dialog, use [Navigator.restorablePush]
/// or [Navigator.restorablePushNamed] with [DialogRouteCustom].
///

///
/// {@tool sample --template=freeform}
///
/// This sample demonstrates how to create a restorable Material dialog. This is
/// accomplished by enabling state restoration by specifying
/// [MaterialApp.restorationScopeId] and using [Navigator.restorablePush] to
/// push [DialogRouteCustom] when the button is tapped.
///
/// {@macro flutter.widgets.RestorationManager}
///
/// ```dart imports
/// import 'package:flutter/material.dart';
/// ```
///
/// ```dart
/// void main() {
///   runApp(MyApp());
/// }
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       restorationScopeId: 'app',
///       title: 'Restorable Routes Demo',
///       home: MyHomePage(),
///     );
///   }
/// }
///
/// class MyHomePage extends StatelessWidget {
///   static Route<Object?> _dialogBuilder(BuildContext context, Object? arguments) {
///     return DialogRouteCustom<void>(
///       context: context,
///       builder: (BuildContext context) => const AlertDialog(title: Text('Material Alert!')),
///     );
///   }
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: Center(
///         child: OutlinedButton(
///           onPressed: () {
///             Navigator.of(context).restorablePush(_dialogBuilder);
///           },
///           child: const Text('Open DialogCustom'),
///         ),
///       ),
///     );
///   }
/// }
/// ```
///
/// {@end-tool}
///
/// See also:
///
///  * [AlertDialog], for dialogs that have a row of buttons below a body.
///  * [SimpleDialog], which handles the scrolling of the contents and does
///    not show buttons below its body.
///  * [DialogCustom], on which [SimpleDialog] and [AlertDialog] are based.
///  * [showGeneralDialog], which allows for customization of the dialog popup.
///  * <https://material.io/design/components/dialogs.html>
Future<T?> showDialogCustom<T>({
  required BuildContext context,
  required WidgetBuilder? builder,
  bool? barrierDismissible = true,
  Color barrierColor = Colors.black54,
  String? barrierLabel,
  bool? useSafeArea = true,
  bool useRootNavigator = true,
  RouteSettings? routeSettings,
  TypeAnimationPage typeAnimation = TypeAnimationPage.fadeScale,
  Curve curves = Curves.easeOut,
}) {
  assert(builder != null);
  assert(barrierDismissible != null);
  assert(useSafeArea != null);
  //assert(useRootNavigator != null);
  assert(debugCheckHasMaterialLocalizations(context));

  final themes = InheritedTheme.capture(
    from: context,
    to: Navigator.of(
      context,
      rootNavigator: useRootNavigator,
    ).context,
  );

  return Navigator.of(context, rootNavigator: useRootNavigator).push<T>(
      DialogRouteCustom<T>(
          context: context,
          builder: builder!,
          barrierColor: barrierColor,
          barrierDismissible: barrierDismissible,
          barrierLabel: barrierLabel,
          useSafeArea: useSafeArea,
          settings: routeSettings,
          themes: themes,
          curves: curves,
          typeAnimation: typeAnimation));
}

/// A dialog route with Material entrance and exit animations,
/// modal barrier color, and modal barrier behavior (dialog is dismissible
/// with a tap on the barrier).
///
/// It is used internally by [showDialog] or can be directly pushed
/// onto the [Navigator] stack to enable state restoration. See
/// [showDialog] for a state restoration app example.
///
/// This function takes a `builder` which typically builds a [DialogCustom] widget.
/// Content below the dialog is dimmed with a [ModalBarrier]. The widget
/// returned by the `builder` does not share a context with the location that
/// `showDialog` is originally called from. Use a [StatefulBuilder] or a
/// custom [StatefulWidget] if the dialog needs to update dynamically.
///
/// The `context` argument is used to look up
/// [MaterialLocalizations.modalBarrierDismissLabel], which provides the
/// modal with a localized accessibility label that will be used for the
/// modal's barrier. However, a custom `barrierLabel` can be passed in as well.
///
/// The `barrierDismissible` argument is used to indicate whether tapping on the
/// barrier will dismiss the dialog. It is `true` by default and cannot be `null`.
///
/// The `barrierColor` argument is used to specify the color of the modal
/// barrier that darkens everything below the dialog. If `null`, the default
/// color `Colors.black54` is used.
///
/// The `useSafeArea` argument is used to indicate if the dialog should only
/// display in 'safe' areas of the screen not used by the operating system
/// (see [SafeArea] for more details). It is `true` by default, which means
/// the dialog will not overlap operating system areas. If it is set to `false`
/// the dialog will only be constrained by the screen size. It can not be `null`.
///
/// The `settings` argument define the settings for this route. See
/// [RouteSettings] for details.
///
/// See also:
///
///  * [showDialog], which is a way to display a DialogRouteCustom.
///  * [showGeneralDialog], which allows for customization of the dialog popup.
class DialogRouteCustom<T> extends RawDialogRoute<T> {
  /// A dialog route with Material entrance and exit animations,
  /// modal barrier color, and modal barrier behavior (dialog is dismissible
  /// with a tap on the barrier).
  DialogRouteCustom({
    required BuildContext context,
    required WidgetBuilder builder,
    CapturedThemes? themes,
    Color? barrierColor = Colors.black54,
    bool? barrierDismissible = true,
    String? barrierLabel,
    bool? useSafeArea = true,
    RouteSettings? settings,
    required TypeAnimationPage typeAnimation,
    required Curve curves,
  })  : assert(barrierDismissible != null),
        super(
          pageBuilder: (BuildContext buildContext, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            final Widget pageChild = Builder(builder: builder);
            var dialog = themes?.wrap(pageChild) ?? pageChild;
            if (useSafeArea!) {
              dialog = SafeArea(child: dialog);
            }
            return dialog;
          },
          barrierDismissible: barrierDismissible!,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel ??
              MaterialLocalizations.of(context).modalBarrierDismissLabel,
          transitionDuration: const Duration(milliseconds: 150),
          settings: settings,
          transitionBuilder: (context, animation, secondaryAnimation, child) =>
              buildMaterialTransitions(
                  context: context,
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  typeAnimation: typeAnimation,
                  curves: curves,
                  child: child),
        );
}
