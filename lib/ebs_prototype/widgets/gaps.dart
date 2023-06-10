// SizedBox verticalGap() {
//   return const SizedBox(
//     height: 20,
//   );
// }

// SizedBox onBoardingVerticalGap() {
//   return const SizedBox(
//     height: 30,
//   );
// }

import 'package:flutter/material.dart';

class ShortVerticalGap extends StatelessWidget {
  const ShortVerticalGap({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

// SizedBox longShortVerticalGap() {
//   return const SizedBox(
//     height: 5,
//   );
// }

// SizedBox shortestVerticalGap() {
//   return const SizedBox(
//     height: 3,
//   );
// }
class HorizontalGap extends StatelessWidget {
  const HorizontalGap({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
    );
  }
}


// SizedBox shortHorizontalGap() {
//   return const SizedBox(
//     width: 10,
//   );
// }