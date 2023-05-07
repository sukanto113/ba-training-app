import 'package:flutter/material.dart';

class TextFieldDemo1 extends StatefulWidget {
  const TextFieldDemo1({super.key});

  @override
  State<TextFieldDemo1> createState() => _TextFieldDemo1State();
}

class _TextFieldDemo1State extends State<TextFieldDemo1> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                      hintText: "Enter Your Name",
                      border: OutlineInputBorder()),
                  onChanged: (value) {
                    print("changed: $value");
                  },
                  onSubmitted: (value) {
                    print("submit: $value");
                    setState(() {
                      _name = value;
                    });
                  },
                ),
              ),
              _name.isNotEmpty ? Text("Hello $_name!") : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
