import 'package:flutter/material.dart';

const List<String> kSAARCCountries = [
  "Afghanistan",
  "Bangladesh",
  "Bhutan",
  "India",
  "Maldives",
  "Nepal",
  "Pakistan",
  "Sri-Lanka",
];

class DropdownButtonDemo1 extends StatefulWidget {
  const DropdownButtonDemo1({super.key});

  @override
  State<DropdownButtonDemo1> createState() => _DropdownButtonDemo1State();
}

class _DropdownButtonDemo1State extends State<DropdownButtonDemo1> {
  String _selectedCountryValue = kSAARCCountries[0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: _selectedCountryValue,
                items: kSAARCCountries
                    .map(
                      (country) => DropdownMenuItem(
                        value: country,
                        child: Text(country),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedCountryValue = value!;
                  });
                },
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black),
                  children: [
                    const TextSpan(text: "You have selected "),
                    TextSpan(
                      text: _selectedCountryValue,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
