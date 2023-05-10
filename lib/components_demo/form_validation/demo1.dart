import 'package:flutter/material.dart';

class FormValidationDemo1 extends StatefulWidget {
  const FormValidationDemo1({super.key});

  @override
  State<FormValidationDemo1> createState() => _FormValidationDemo1State();
}

class _FormValidationDemo1State extends State<FormValidationDemo1> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) {
            return Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autofocus: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          return (value != null &&
                                  (value.contains('@') || value.isEmpty))
                              ? 'Name should not be empty'
                              : null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.key),
                          hintText: 'password',
                          labelText: 'Password *',
                        ),
                        validator: (String? value) {
                          return (value != null && value.length < 8)
                              ? 'Password should be 8 char long.'
                              : null;
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Welldone form fields are valid!"),
                            ),
                          );
                        }
                      },
                      child: const Text("Validate"),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
