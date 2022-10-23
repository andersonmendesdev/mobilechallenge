import 'package:flutter/material.dart';

import '../../../../core/enum/enum_filter.dart';

class ButtonFilterGenderWidget extends StatelessWidget {
  const ButtonFilterGenderWidget(
      {Key? key,
      required this.icon,
      required this.label,
      required this.genderValue,
      required this.currentGender,
      required this.onTap})
      : super(key: key);

  final IconData icon;
  final String label;
  final FilterGenderEnum genderValue;
  final FilterGenderEnum currentGender;
  final void Function(FilterGenderEnum gender) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = genderValue == currentGender;
    final primaryColor = Theme.of(context).primaryColor;
    final colorSelected = primaryColor.withOpacity(0.18);
    final borderSelected = Border.all(width: 0.6, color: Colors.black26);
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (isSelected) {
                onTap(FilterGenderEnum.none);
              } else {
                onTap(genderValue);
              }
            },
            child: Container(
              //duration: const Duration(milliseconds: 100),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? colorSelected : Colors.white,
                  border: isSelected ? null : borderSelected),
              child: Center(
                child: Icon(
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

class ButtonFilterNatWidget extends StatelessWidget {
  const ButtonFilterNatWidget(
      {Key? key,
      required this.icon,
      required this.label,
      required this.natValue,
      required this.currentNat,
      this.margin,
      required this.onTap})
      : super(key: key);

  final String icon;
  final String label;
  final EdgeInsetsGeometry? margin;
  final FilterNatEnum natValue;
  final FilterNatEnum currentNat;
  final void Function(FilterNatEnum nat) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = natValue == currentNat;
    final primaryColor = Theme.of(context).primaryColor;
    final colorSelected = primaryColor.withOpacity(0.18);
    final borderSelected = Border.all(width: 0.6, color: Colors.black26);
    return Container(
      margin: margin, //const EdgeInsets.only(left: 15, right: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (isSelected) {
                onTap(FilterNatEnum.none);
              } else {
                onTap(natValue);
              }
            },
            child: Container(
              //duration: const Duration(milliseconds: 100),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? colorSelected : Colors.white,
                  border: isSelected ? null : borderSelected),
              child: Center(
                child: Text(
                  icon,
                  style: TextStyle(
                      color: isSelected ? primaryColor : Colors.black38,
                      fontWeight:
                          isSelected ? FontWeight.w600 : FontWeight.w500),
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
