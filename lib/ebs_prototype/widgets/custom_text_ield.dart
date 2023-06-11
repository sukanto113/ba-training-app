import 'package:flutter/material.dart';

import '../utils/constants/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.controller,
    this.autoValidateMode,
    required this.title,
    this.hintTextName,
    this.onChangedFunction,
    required this.textInputType,
    this.onPressed,
    this.icon,
    required this.readOnly,
    required this.maxValue,
    this.validator,
    this.textInputAction,
    this.isTrue,
    this.fillColor,
    this.isRequired,
    this.filled,
    this.borderRadius,
    this.borderSide,
    this.obscureTextTy = false,
    this.initialValue,
    this.maxWord,
    this.contentPadding,
  }) : super(key: key);
  final String title;
  final AutovalidateMode? autoValidateMode;
  final String? hintTextName;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final bool? isTrue;
  final String? initialValue;
  final ValueChanged<String>? onChangedFunction;
  final bool readOnly;
  final Function()? onPressed;
  final int? maxWord;
  final bool? filled;

  final FormFieldValidator<String>? validator;
  final IconData? icon;
  final int maxValue;
  final bool obscureTextTy;
  final bool? isRequired;
  final TextEditingController? controller;
  final BorderRadius? borderRadius;
  final BorderSide? borderSide;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autoValidateMode,
      initialValue: initialValue,
      readOnly: readOnly,
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      style: normalTextStyle,
      cursorColor: Colors.black,
      maxLines: maxValue,
      maxLength: maxWord,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        hintText: hintTextName,
        contentPadding:
            contentPadding ?? const EdgeInsets.fromLTRB(15, 30, 0, 0),
        filled: filled,
        fillColor: fillColor,
        errorStyle: const TextStyle(
          fontSize: 0,
          height: 50,
        ),
        counter: const Offstage(),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          borderSide:
              borderSide ?? const BorderSide(color: Colors.grey, width: 1.0),
        ),
        // hintStyle: normalTextStyle,
        labelText: title,
        labelStyle: normalBlackTextStyle,
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          borderSide:
              borderSide ?? const BorderSide(color: Colors.grey, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(0),
          borderSide:
              borderSide ?? const BorderSide(color: Colors.grey, width: 1.0),
        ),
        isDense: true, // Added this
        // contentPadding: const EdgeInsets.all(15),
        suffixIcon: isRequired == true
            ? IconButton(
                icon: const Icon(
                  Icons.star,
                  color: Colors.red,
                ),
                onPressed: onPressed,
              )
            : IconButton(
                icon: const Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                onPressed: onPressed,
              ),
      ),
      autofocus: false,
      onChanged: onChangedFunction,
      obscureText: obscureTextTy,
    );
  }
}
