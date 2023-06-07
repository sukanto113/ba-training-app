import 'package:flutter/material.dart';

import '../utils/selectable_item.dart';
import 'gaps.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton(
      {Key? key,
      this.radioButtonContainerWidth,
      this.radioButtonContainerHeight,
      required this.radioButtonContainerBorderWidth,
      required this.rdaioButtonContainerColor,
      required this.radioButtonValue,
      required this.radioButtonGroupValue,
      required this.radioButtonLebelText,
      required this.fontSize,
      required this.radioButtonLebelTextLabelColor,
      required this.onChange,
      required this.radiobButtonActiveColor})
      : super(key: key);

  final ValueChanged<SelectableItem> onChange;
  final double? radioButtonContainerWidth;
  final double? radioButtonContainerHeight;
  final double radioButtonContainerBorderWidth;
  final Color rdaioButtonContainerColor;
  final SelectableItem radioButtonValue;
  final SelectableItem? radioButtonGroupValue;
  final String radioButtonLebelText;
  final double fontSize;
  final Color radioButtonLebelTextLabelColor;
  final Color radiobButtonActiveColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (radioButtonValue != radioButtonGroupValue) {
          onChange(radioButtonValue);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        child: Row(
          children: [
            Radio<SelectableItem>(
              activeColor: radiobButtonActiveColor,
              value: radioButtonValue,
              groupValue: radioButtonGroupValue,
              onChanged: (SelectableItem? newValue) {
                if (newValue != null) {
                  onChange(newValue);
                }
              },
            ),
            Text(
              radioButtonLebelText,
              style: TextStyle(
                fontSize: fontSize,
                color: radioButtonLebelTextLabelColor,
              ),
              textAlign: TextAlign.left,
            ),
            const HorizontalGap(),
          ],
        ),
      ),
    );
  }
}
