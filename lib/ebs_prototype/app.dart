import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import 'features/support/presentation/support_list/support_list_screen.dart';

class EBSSupportDemoApp extends StatelessWidget {
  const EBSSupportDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'EBS Support Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SupportListPage(),
    );
  }
}
