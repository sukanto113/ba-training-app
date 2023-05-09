import 'package:dropdown_search/dropdown_search.dart';
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

class DropdownSearchDemo1 extends StatefulWidget {
  const DropdownSearchDemo1({super.key});

  @override
  State<DropdownSearchDemo1> createState() => _DropdownSearchDemo1State();
}

class _DropdownSearchDemo1State extends State<DropdownSearchDemo1> {
  String _selectedCountryValue = kSAARCCountries[0];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                      showSelectedItems: true,
                      disabledItemFn: (item) => item == "Maldives",
                      showSearchBox: true),
                  selectedItem: kSAARCCountries[1],
                  items: kSAARCCountries,
                  onChanged: (value) {
                    setState(() {
                      _selectedCountryValue = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
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
      ),
    );
  }
}
