import 'package:flutter/material.dart';

import '../../../theme/palette.dart';


class SubTitleResumeWidget extends StatelessWidget {
  const SubTitleResumeWidget(
      {Key? key,
      required this.text,
      this.size = 17,
      this.color,
      this.fontWeight = FontWeight.w600})
      : super(key: key);

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: fontWeight, fontSize: size, color: color));
  }
}

class SubTitle2ResumeWidget extends StatelessWidget {
  const SubTitle2ResumeWidget(
      {Key? key,
      required this.text,
      this.size = 15,
      this.fontWeight = FontWeight.w600,
      this.color = Colors.black54})
      : super(key: key);

  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: fontWeight, fontSize: size, color: color));
  }
}

class SubTitle3ResumeWidget extends StatelessWidget {
  const SubTitle3ResumeWidget(
      {Key? key,
      required this.text,
      this.color = ColorPalette.black33333F,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w500,
      this.softWrap = false,
      this.textAlign})
      : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final bool softWrap;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(fontWeight: fontWeight, fontSize: fontSize, color: color),
      softWrap: softWrap,
      overflow: TextOverflow.clip,
      textAlign: textAlign,
    );
  }
}
