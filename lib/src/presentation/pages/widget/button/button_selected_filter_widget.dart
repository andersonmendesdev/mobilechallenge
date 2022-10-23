import 'package:flutter/material.dart';

class ButtonFilterWidget<T> extends StatelessWidget {
  const ButtonFilterWidget({
    Key? key,
    this.icon,
    this.iconLabel = '',
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onTap,
    this.margin = const EdgeInsets.all(0),
  }) : super(key: key);

  final IconData? icon;
  final String iconLabel;
  final String label;
  final T value;
  final T groupValue;
  final void Function(T? value) onTap;
  final EdgeInsetsGeometry margin;

//FilterGenderEnum.none
  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    final primaryColor = Theme.of(context).primaryColor;
    final colorSelected = primaryColor.withOpacity(0.18);
    final borderSelected = Border.all(width: 0.6, color: Colors.black26);
    return Container(
      margin: margin,
      child: Column(
        children: [
          InkResponse(
            onTap: () {
              if (isSelected) {
                onTap(null);
              } else {
                onTap(value);
              }
            },
            child: Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? colorSelected : Colors.white,
                  border: isSelected ? null : borderSelected),
              child: Center(
                child: icon == null
                    ? Text(
                        iconLabel,
                        style: TextStyle(
                            color: isSelected ? primaryColor : Colors.black38,
                            fontWeight:
                                isSelected ? FontWeight.w600 : FontWeight.w500),
                      )
                    : Icon(
                        icon,
                        color: isSelected ? primaryColor : Colors.black38,
                        size: 28,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: isSelected ? primaryColor : Colors.black38),
          )
        ],
      ),
    );
  }
}
