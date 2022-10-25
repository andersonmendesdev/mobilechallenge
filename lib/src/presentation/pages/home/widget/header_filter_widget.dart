import 'package:flutter/material.dart';

import '../../../../core/enum/enum_filter.dart';

class HeaderFilterWidget extends StatelessWidget {
  const HeaderFilterWidget({
    Key? key,
    required this.onTouch,
    required this.filterGender,
    required this.filterNat,
  }) : super(key: key);

  final Function(TypeFilterEnum type) onTouch;
  final FilterGenderEnum filterGender;
  final FilterNatEnum filterNat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 15),
        children: [
          _ButtonAllFilter(
              onTap: () => onTouch(TypeFilterEnum.all),
              filterNat: filterNat,
              filterGender: filterGender,
              label: 'Filter'),
          _ButtonFilterWidget(
              onTap: () => onTouch(TypeFilterEnum.gender),
              isSelected: filterGender != FilterGenderEnum.none,
              label: filterGender != FilterGenderEnum.none
                  ? filterGender.toValueView()
                  : 'Gender'),
          _ButtonFilterWidget(
              onTap: () => onTouch(TypeFilterEnum.nat),
              isSelected: filterNat != FilterNatEnum.none,
              label: filterNat != FilterNatEnum.none
                  ? filterNat.toValueView()
                  : 'Nationality'),
        ],
      ),
    );
  }
}

class _ButtonAllFilter extends StatelessWidget {
  const _ButtonAllFilter({
    Key? key,
    required this.onTap,
    required this.label,
    required this.filterGender,
    required this.filterNat,
  }) : super(key: key);
  final VoidCallback onTap;
  final String label;
  final FilterGenderEnum filterGender;
  final FilterNatEnum filterNat;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    var isSelected = filterGender != FilterGenderEnum.none ||
        filterNat != FilterNatEnum.none;

    var totalbagede = 0;
    if(filterGender != FilterGenderEnum.none){
      totalbagede += 1;
    }
    if(filterNat != FilterNatEnum.none){
      totalbagede += 1;
    }

    const styleUnSelected = TextStyle(color: Colors.black54);
    final styleSelected =
        TextStyle(color: primaryColor, fontWeight: FontWeight.w500);
    return Container(
      margin: const EdgeInsets.only(left: 0, right: 8, top: 10, bottom: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onTap,
            child: Container(
              color: Colors.white,
              child: Container(
                color: isSelected
                    ? primaryColor.withOpacity(0.18)
                    : Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(label,
                        style: isSelected ? styleSelected : styleUnSelected),
                    const SizedBox(width: 4),
                    isSelected ? BagdeWidget(total: totalbagede) :  const Icon(Icons.sort, color: Colors.black54)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonFilterWidget extends StatelessWidget {
  const _ButtonFilterWidget({
    Key? key,
    required this.onTap,
    required this.label,
    required this.isSelected,
  }) : super(key: key);

  final VoidCallback onTap;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    const styleUnSelected = TextStyle(color: Colors.black54);
    final styleSelected =
        TextStyle(color: primaryColor, fontWeight: FontWeight.w500);
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: onTap,
            child: Container(
              color: Colors.white,
              child: Container(
                color: isSelected
                    ? primaryColor.withOpacity(0.18)
                    : Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(label,
                        style: isSelected ? styleSelected : styleUnSelected),
                    const SizedBox(width: 4),
                    Icon(Icons.keyboard_arrow_down_rounded,
                        color: isSelected ? primaryColor : Colors.black54)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BagdeWidget extends StatelessWidget {
  const BagdeWidget({Key? key, required this.total}) : super(key: key);

  final int total;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final brightness = ThemeData.estimateBrightnessForColor(primaryColor);
    final color = brightness == Brightness.light ? Colors.black : Colors.white;
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
      ),
      child: Center(child: Text('$total', style: TextStyle(color: color))),
    );
  }
}
