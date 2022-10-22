import 'package:flutter/material.dart';

class TitleResumeWidget extends StatelessWidget {
  const TitleResumeWidget(
      {Key? key,
      required this.text,
      this.size = 18,
      this.fontWeight = FontWeight.w600})
      : super(key: key);

  final String text;
  final double size;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: TextAlign.start,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(fontWeight: fontWeight, fontSize: size));
  }
}
