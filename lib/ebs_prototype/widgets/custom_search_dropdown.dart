import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../utils/constants/text_styles.dart';

class CustomSearchDropDown extends StatelessWidget {
  CustomSearchDropDown(
      {Key? key,
      required this.onSelected,
      required this.searchBox,
      this.buttonName,
      required this.title,
      this.child,
      this.icons,
      this.style,
      this.validator,
      required this.items,
      this.selectedItem,
      this.isExpand,
      this.fillColor,
      this.borderRadius,
      this.filled,
      this.borderSide,
      this.hintText,
      this.autovalidateMode,
      this.contentPadding})
      : super(key: key);
  final Function(String value) onSelected;
  final String? buttonName;
  final String title;
  final AutovalidateMode? autovalidateMode;
  final IconData? icons;
  final Widget? child;
  final ButtonStyle? style;
  final bool searchBox;
  final List<String> items;
  final String? selectedItem;
  final bool? isExpand;

  final FormFieldValidator<String>? validator;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final String? hintText;
  final bool? filled;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>(
      autoValidateMode: autovalidateMode,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          contentPadding:
              contentPadding ?? const EdgeInsets.fromLTRB(15, 30, 0, 0),
          // contentPadding: const EdgeInsets.fromLTRB(25, 30, 0, 0),
          filled: filled,
          hintText: hintText,
          fillColor: fillColor,
          errorStyle: const TextStyle(fontSize: 0, height: 50),
          label: Text(
            title,
            style: normalTextStyle,
          ),
          focusedBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            borderSide:
                borderSide ?? const BorderSide(color: Colors.grey, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.grey, width: 1.0),
            borderRadius: borderRadius ?? BorderRadius.circular(0),
            borderSide:
                borderSide ?? const BorderSide(color: Colors.grey, width: 1.0),
          ),
          border: const OutlineInputBorder(),
        ),
      ),
      popupProps: PopupProps.menu(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.4),
        fit: FlexFit.tight,
        showSelectedItems: true,
        showSearchBox: searchBox,
      ),
      items: items,
      onChanged: (value) {
        onSelected(value ?? "");
      },
      selectedItem: selectedItem,
      validator: validator,
    );
  }
}
