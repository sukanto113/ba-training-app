import 'package:flutter/material.dart';

import '../utils/selectable_item.dart';
import 'custom_radio_button.dart';

class CustomRadioButtonGroup extends StatefulWidget {
  const CustomRadioButtonGroup({
    Key? key,
    this.existingRadioSelected,
    required this.options,
  }) : super(key: key);
  
  final SelectableItem? existingRadioSelected;
  final List<SelectableItem> options;
  @override
  State<CustomRadioButtonGroup> createState() => _CustomRadioButtonGroupState();
}

class _CustomRadioButtonGroupState extends State<CustomRadioButtonGroup> {
  SelectableItem? selectedValue;
  late double width;

  void _controllChange(SelectableItem value) {
    setState(() {
      selectedValue = value;
      value.onSelect();
    });
  }

  @override
  void initState() {
    super.initState();

    final existingRadioSelected = widget.existingRadioSelected;
    if (existingRadioSelected != null) {
      selectedValue = existingRadioSelected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: widget.options
              .map(
                (option) => CustomRadioButton(
                  onChange: _controllChange,
                  radioButtonContainerWidth: 130,
                  radioButtonContainerHeight: 50,
                  radiobButtonActiveColor: Colors.indigo,
                  radioButtonGroupValue: selectedValue,
                  radioButtonContainerBorderWidth: 1,
                  rdaioButtonContainerColor:
                      selectedValue == option ? Colors.indigo : Colors.black45,
                  radioButtonValue: option,
                  radioButtonLebelText: option.displayName,
                  fontSize: 16,
                  radioButtonLebelTextLabelColor:
                      selectedValue == option ? Colors.indigo : Colors.black,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
