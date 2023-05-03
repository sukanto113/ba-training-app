import 'package:flutter/material.dart';

class CheckboxDemo1 extends StatefulWidget {
  const CheckboxDemo1({super.key});

  @override
  State<CheckboxDemo1> createState() => _CheckboxDemo1State();
}

class _CheckboxDemo1State extends State<CheckboxDemo1> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Checkbox(
            value: isChecked,
            tristate: true,
            onChanged: (value) {
              setState(() {
                print("Checkbox value is $value");
                isChecked = value;
              });
            },
          ),
        ),
      ),
    );
  }
}
