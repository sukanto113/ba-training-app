import 'package:flutter/material.dart';

enum Gender { male, female }

class RadioButtonDemo1 extends StatefulWidget {
  const RadioButtonDemo1({super.key});

  @override
  State<RadioButtonDemo1> createState() => _RadioButtonDemo1State();
}

class _RadioButtonDemo1State extends State<RadioButtonDemo1> {
  Gender? _gender;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Select Gender")),
        body: ListView(
          children: [
            ListTile(
              leading: Radio<Gender>(
                value: Gender.male,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              title: const Text("Male"),
            ),
            ListTile(
              leading: Radio<Gender>(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (value) {
                  setState(() {
                    _gender = value;
                  });
                },
              ),
              title: const Text("Female"),
            )
          ],
        ),
      ),
    );
  }
}
