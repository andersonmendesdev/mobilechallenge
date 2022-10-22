import 'package:flutter/material.dart';

class RadioActionWidget<T> extends StatelessWidget {
  const RadioActionWidget(
      {Key? key,
      required this.title,
      required this.value,
      required this.valueFilter,
      required this.onChange})
      : super(key: key);

  final T? value;
  final T valueFilter;
  final String title;

  final void Function(T? value) onChange;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 0, top: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Radio<T>(
                value: valueFilter,
                groupValue: value,
                onChanged: onChange,
              ),
            ],
          ),
        ),
        onTap: () => onChange(valueFilter));
  }
}
