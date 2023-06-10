import 'package:flutter/material.dart';

import '../utils/constants/text_styles.dart';

class MandatoryFormLabel extends StatelessWidget {
  const MandatoryFormLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BoldNormalFlexibleText(text: label),
        const SizedBox(
          width: 5,
        ),
        const Icon(
          Icons.star,
          color: Colors.red,
          size: 15,
        ),
      ],
    );
  }
}

class NonMandatoryFormLabel extends StatelessWidget {
  const NonMandatoryFormLabel({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return BoldNormalFlexibleText(text: label);
  }
}

class BoldNormalFlexibleText extends StatelessWidget {
  const BoldNormalFlexibleText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        style: boldNormalTextStyle,
      ),
    );
  }
}
