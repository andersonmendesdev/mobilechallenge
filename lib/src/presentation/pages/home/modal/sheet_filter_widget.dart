import 'package:flutter/material.dart';

import '../../../../core/enum/enum_filter.dart';
import '../../widget/button/button_back_modal_sheet.dart';
import '../../widget/button/button_selected_filter_widget.dart';
import '../../widget/text/_export.dart';

class ModalSheetFilter extends StatefulWidget {
  const ModalSheetFilter({
    Key? key,
    required this.onChangeFilter,
    required this.filterGender,
    required this.filterNat,
    required this.type,
  }) : super(key: key);
  final FilterGenderEnum filterGender;
  final FilterNatEnum filterNat;
  final TypeFilterEnum type;

  final void Function(FilterGenderEnum filterGender, FilterNatEnum filterNat)
      onChangeFilter;

  @override
  State<ModalSheetFilter> createState() => _ModalSheetFilterState();
}

class _ModalSheetFilterState extends State<ModalSheetFilter> {
  var _filterGender = FilterGenderEnum.none;
  var _filterNat = FilterNatEnum.none;

  @override
  void initState() {
    super.initState();
    _filterGender = widget.filterGender;
    _filterNat = widget.filterNat;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = Theme.of(context).primaryColor;
    final brightness = ThemeData.estimateBrightnessForColor(primaryColor);
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const ButtonBackModalSheet(),
          if (widget.type == TypeFilterEnum.gender ||
              widget.type == TypeFilterEnum.all)
            Column(
              children: const [
                SubTitleResumeWidget(text: 'Gender'),
                SizedBox(height: 10),
              ],
            ),
          if (widget.type == TypeFilterEnum.gender ||
              widget.type == TypeFilterEnum.all)
            _BuilderFilterGender(
                filterGender: _filterGender, onChangeFilter: _onChangeFilter),
          const SizedBox(height: 20),
          if (widget.type == TypeFilterEnum.nat ||
              widget.type == TypeFilterEnum.all)
            Column(
              children: const [
                SubTitleResumeWidget(text: 'Nationality'),
                SizedBox(height: 10),
              ],
            ),
          if (widget.type == TypeFilterEnum.nat ||
              widget.type == TypeFilterEnum.all)
            _BuilderFilterNat(
              filterNat: _filterNat,
              onChangeFilter: _onChangeFilterNat,
            ),
          // if (widget.type == TypeFilterEnum.all)
          //   Column(
          //     //padding: const EdgeInsets.only(bottom: 80),
          //     children: [
          //       Column(
          //         children: const [
          //           SubTitleResumeWidget(text: 'Gender'),
          //           SizedBox(height: 20),
          //         ],
          //       ),
          //       _BuilderFilterGender(
          //           filterGender: _filterGender,
          //           onChangeFilter: _onChangeFilter),
          //       const Divider(height: 1),
          //       const SizedBox(height: 10),
          //       Column(
          //         children: const [
          //           SubTitleResumeWidget(text: 'Nationality'),
          //           SizedBox(height: 20),
          //         ],
          //       ),
          //       _BuilderFilterNat(
          //           filterNat: _filterNat,
          //           onChangeFilter: _onChangeFilterNat,
          //           isListViewExpanded: false),
          //     ],
          //   ),
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                    color: Colors.white,
                    textColor: theme.primaryColor,
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: MaterialButton(
                    color: theme.primaryColor,
                    colorBrightness: brightness,
                    child: const Text('Ver resultados'),
                    onPressed: () {
                      widget.onChangeFilter(_filterGender, _filterNat);
                      Navigator.of(context).pop();
                    }),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _onChangeFilter(FilterGenderEnum? value) {
    setState(() {
      _filterGender = value!;
    });
  }

  void _onChangeFilterNat(FilterNatEnum? value) {
    setState(() {
      _filterNat = value!;
    });
  }
}

class _BuilderFilterGender extends StatelessWidget {
  const _BuilderFilterGender(
      {Key? key, required this.filterGender, required this.onChangeFilter})
      : super(key: key);

  final FilterGenderEnum filterGender;
  final void Function(FilterGenderEnum? value) onChangeFilter;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonFilterGenderWidget(
            icon: Icons.male,
            label: 'Male',
            genderValue: FilterGenderEnum.male,
            currentGender: filterGender,
            onTap: onChangeFilter,
          ),
          ButtonFilterGenderWidget(
              icon: Icons.female,
              label: 'Female',
              genderValue: FilterGenderEnum.female,
              currentGender: filterGender,
              onTap: onChangeFilter),
        ]);
    // return Column(
    //   children: <Widget>[
    //     for (var item in FilterGenderEnum.values)
    //       RadioActionWidget<FilterGenderEnum>(
    //           title: item.toValueView(),
    //           value: filterGender,
    //           valueFilter: item,
    //           onChange: onChangeFilter),
    //   ],
    // );
  }
}

class _BuilderFilterNat extends StatelessWidget {
  const _BuilderFilterNat(
      {Key? key, required this.filterNat, required this.onChangeFilter})
      : super(key: key);
  final FilterNatEnum filterNat;
  final void Function(FilterNatEnum? value) onChangeFilter;

  @override
  Widget build(BuildContext context) {
    var listWidget = List.generate(FilterNatEnum.values.length, (index) {
      var item = FilterNatEnum.values[index];
      if(item == FilterNatEnum.none){
        return Container();
      }
      return ButtonFilterNatWidget(
          icon: item.toValueQuery().isEmpty ? 'NONE' : item.toValueQuery(),
          label: item.toValueView(),
          natValue: item,
          currentNat: filterNat,
          onTap: onChangeFilter);
    });

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              spacing: 15,
              runSpacing: 15,
              alignment: WrapAlignment.center,
              children: listWidget,
            ),
            const SizedBox(height: 80)
          ],
        ),
      ),
    );
  }
}
