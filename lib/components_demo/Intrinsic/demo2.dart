import 'package:flutter/material.dart';

class IntrinsicWidgetDemo2 extends StatelessWidget {
  const IntrinsicWidgetDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints(minHeight: 500),
          child: IntrinsicHeight(
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: const Color(0xffeeee00),
                  alignment: Alignment.center,
                  child: const Text(
                    "Fixed Height Content",
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    color: const Color(0xff008000),
                    alignment: Alignment.center,
                    child: const Text(
                      "Fixed Height Content",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
