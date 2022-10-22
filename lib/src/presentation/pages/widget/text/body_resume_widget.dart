import 'package:flutter/material.dart';

class BodyResumePage extends StatelessWidget {
  const BodyResumePage({Key? key, required this.text, this.textStyle})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    var defaultStyle =
        Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black87);

    var style = defaultStyle;
    if (textStyle != null) {
      style = defaultStyle.merge(textStyle);
    }
    if (text.isEmpty) {
      return Text('-', style: style);
    }
    return Text(text, style: style);
  }
}

class Body2ResumePage extends StatelessWidget {
  const Body2ResumePage(
      {Key? key,
      required this.text,
      this.textStyle,
      this.size = 16,
      this.color})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var defaultStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: color ?? Colors.black54, fontSize: size);

    var style = defaultStyle;
    if (textStyle != null) {
      style = defaultStyle.merge(textStyle) ;
    }
    if (text.isEmpty) {
      //Não informado.
      return Text('-', style: style);
    }
    return Text(text, style: style, softWrap: true);
  }
}
