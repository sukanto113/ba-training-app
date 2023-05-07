import 'package:flutter/material.dart';

class TextFormFieldDemo1 extends StatefulWidget {
  const TextFormFieldDemo1({super.key});

  @override
  State<TextFormFieldDemo1> createState() => _TextFromFieldDemo1State();
}

class _TextFromFieldDemo1State extends State<TextFormFieldDemo1> {
  String _name = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autofocus: true,
                    autovalidateMode: AutovalidateMode.always,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Your name',
                      labelText: 'Name *',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? ''
                          : null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.key),
                      hintText: 'password',
                      labelText: 'Password *',
                      errorStyle: TextStyle(height: 0),
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.length<8)
                          ? ''
                          : null;
                    },
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
