import 'package:flutter/material.dart';

enum Gender { male, female }

class RadioButtonDemo2 extends StatefulWidget {
  const RadioButtonDemo2({super.key});

  @override
  State<RadioButtonDemo2> createState() => _RadioButtonDemo1State();
}

class _RadioButtonDemo1State extends State<RadioButtonDemo2> {
  Gender? _gender;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Select Gender")),
        body: ListView(
          children: [
            RadioListTile(
              value: Gender.male,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
              title: const Text("Male"),
            ),
            RadioListTile(
              value: Gender.female,
              groupValue: _gender,
              onChanged: (value) {
                setState(() {
                  _gender = value;
                });
              },
              title: const Text("Female"),
            )
          ],
        ),
      ),
    );
  }
}
