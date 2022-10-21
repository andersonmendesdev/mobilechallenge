part of 'snackbar_widget.dart';

class SnackbarContentWidget extends StatelessWidget {
  const SnackbarContentWidget(
      {Key? key,
      required this.message,
      required this.typed,
      required this.animationController,
      this.spanList = const <TextSpan>[]})
      : super(key: key);

  final String message;
  final TypeSnackBar typed;
  final List<TextSpan> spanList;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width - 16;
    const margin = EdgeInsets.only(left: 8, right: 8);
    const padding = EdgeInsets.only(bottom: 0.2, left: 1, right: 1);
    const paddingContent =
        EdgeInsets.only(left: 15, bottom: 7, right: 7, top: 8);
    const boxDecoration = BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all(Radius.circular(4.0)));

    final buttonClosed = GestureDetector(
      onTap: animationController.reverse,
      child: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Center(
            child:
                Text('OK', style: TextStyle(color: ColorPalette.grey8c8c8c))),
      ),
    );

    switch (typed) {
      case TypeSnackBar.success:
        return Container(
          height: 56,
          width: width,
          margin: margin,
          padding: padding,
          decoration: boxDecoration,
          child: Stack(
            children: [
              Padding(
                padding: paddingContent,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: ColorPalette.green22BAA0OPACITY05,
                              shape: BoxShape.circle),
                          child: Center(
                              child: Icon(Icons.check,
                                  color: ColorPalette.green22BAA0, size: 15))),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(message,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.clip,
                                softWrap: true),
                          ],
                        ),
                      ),
                    ]),
              ),
              //linearProgressbar
            ],
          ),
        );
      case TypeSnackBar.successPush:
        return Container(
          //height: 56,
          width: width,
          margin: margin,
          padding: padding,
          decoration: boxDecoration,
          child: Stack(
            children: [
              Padding(
                padding: paddingContent,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              color: ColorPalette.green22BAA0OPACITY05,
                              shape: BoxShape.circle),
                          child: Center(
                              child: Icon(Icons.check,
                                  color: ColorPalette.green22BAA0, size: 15))),
                      const SizedBox(width: 16),
                      Flexible(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(message,
                                style: const TextStyle(color: Colors.white),
                                overflow: TextOverflow.clip,
                                softWrap: true),
                          ],
                        ),
                      ),
                    ]),
              ),
              //linearProgressbar
            ],
          ),
        );
      case TypeSnackBar.alertScreen:
        return Container(
          height: 56,
          width: width,
          margin: margin,
          padding: padding,
          decoration: boxDecoration,
          child: Stack(
            children: [
              Padding(
                padding: paddingContent,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                            width: 25,
                            height: 25,
                            child: Center(
                                child:
                                    Icon(Icons.warning, color: Colors.yellow))),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(message,
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.clip,
                                  softWrap: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: buttonClosed),
                ]),
              ),
              //linearProgressbar
            ],
          ),
        );
      case TypeSnackBar.alertLarge:
        return Container(
          //height: 56,
          width: width,
          margin: margin,
          padding: padding,
          decoration: boxDecoration,
          child: Stack(
            children: [
              Padding(
                padding: paddingContent,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                            width: 25,
                            height: 25,
                            child: Center(
                                child:
                                    Icon(Icons.warning, color: Colors.yellow))),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(message,
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.clip,
                                  softWrap: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: buttonClosed),
                ]),
              ),
              //linearProgressbar
            ],
          ),
        );
      case TypeSnackBar.errorScreen:
        return Container(
          //height: 56,
          width: width,
          margin: margin,
          padding: padding,
          decoration: boxDecoration,
          child: Stack(
            children: [
              Padding(
                padding: paddingContent,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                color: ColorPalette.redf56B4DOPACITY05,
                                shape: BoxShape.circle),
                            child: Center(
                                child: Icon(Icons.close,
                                    color: ColorPalette.redf56B4D, size: 15))),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(message,
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.clip,
                                  softWrap: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: buttonClosed),
                ]),
              ),
              //linearProgressbar
            ],
          ),
        );
      case TypeSnackBar.alertSpan:
        return Container(
          //height: 56,
          width: width,
          margin: margin,
          padding: padding,
          decoration: boxDecoration,
          child: Stack(
            children: [
              Padding(
                padding: paddingContent,
                child: Row(mainAxisSize: MainAxisSize.max, children: [
                  Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                            width: 25,
                            height: 25,
                            child: Center(
                                child:
                                    Icon(Icons.warning, color: Colors.yellow))),
                        const SizedBox(width: 16),
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    style: const TextStyle(
                                      color: Colors.white70,
                                    ),
                                    children: spanList),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: buttonClosed),
                ]),
              ),
              //linearProgressbar
            ],
          ),
        );
      default:
        return Container();
    }
  }
}
