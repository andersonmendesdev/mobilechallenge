import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.onSubmitted,
    required this.nodeFocus,
    this.onFocus,
    this.isFocus,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final String hintText;
  final void Function(String search) onSubmitted;
  final void Function(bool value)? onFocus;
  final FocusNode nodeFocus;
  final bool? isFocus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = Theme.of(context).primaryColor;
    final brightness = ThemeData.estimateBrightnessForColor(primaryColor);
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;
    return TextField(
      focusNode: nodeFocus,
      controller: textEditingController,
      cursorColor: textColor,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      autofocus: isFocus ?? false,
      style:
          theme.textTheme.headline6!.copyWith(fontSize: 18, color: textColor),
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          onSubmitted(value);
        }
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: hintText,
        filled: false,
        fillColor: Colors.white.withOpacity(0.4),
        hintStyle: TextStyle(
            color: brightness == Brightness.light
                ? Colors.black38
                : Colors.white54),
      ),
    );
  }
}
