import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisibilityRx extends StatelessWidget {
  final Widget child;
  final RxBool visible;
  const VisibilityRx({
    Key? key,
    required this.child,
    required this.visible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Visibility(visible: visible.value, child: child));
  }
}