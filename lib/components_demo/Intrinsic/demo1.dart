
import 'package:flutter/material.dart';

class IntrinsicWidgetDemo1 extends StatelessWidget {
  const IntrinsicWidgetDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: const Color(0xffFFD400),
                  height: 100,
                  width: 100,
                ),
                Container(
                  color: const Color(0xff005ABB),
                  height: 150,
                  width: 150,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: const Color(0xffFFD400),
                    height: 100,
                    width: 50,
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