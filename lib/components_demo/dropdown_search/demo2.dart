// Fetch list form internet

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropdownSearchDemo2 extends StatefulWidget {
  const DropdownSearchDemo2({super.key});

  @override
  State<DropdownSearchDemo2> createState() => _DropdownSearchDemo2State();
}

class _DropdownSearchDemo2State extends State<DropdownSearchDemo2> {
  String _selectedCountryValue = "";

  @override
  void initState() {
    super.initState();
  }

  Future<List<String>> getCountries() async {
    final res = await Dio().get("https://api.first.org/data/v1/countries");
    final data = res.data["data"];
    final List<String> countries = [];
    for (final countryCode in data.keys) {
      countries.add(data[countryCode]["country"]);
    }
    return countries;
  }

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
                    showSearchBox: true,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedCountryValue = value!;
                    });
                  },
                  asyncItems: (_) async {
                    return await getCountries();
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
