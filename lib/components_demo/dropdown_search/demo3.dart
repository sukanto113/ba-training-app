// Example with custom model

import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'doc_example/user_model.dart';

class DropdownSearchDemo3 extends StatefulWidget {
  const DropdownSearchDemo3({super.key});

  @override
  State<DropdownSearchDemo3> createState() => _DropdownSearchDemo3State();
}

class _DropdownSearchDemo3State extends State<DropdownSearchDemo3> {
  String _selectedCountryValue = "";

  @override
  void initState() {
    super.initState();
  }

  Future<List<UserModel>> getData(filter) async {
    var response = await Dio().get(
      "https://63c1210999c0a15d28e1ec1d.mockapi.io/users",
      queryParameters: {"filter": filter},
    );

    final data = response.data;
    if (data != null) {
      return UserModel.fromJsonList(data);
    }

    return [];
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
                DropdownSearch<UserModel>(
                  popupProps: PopupProps.menu(
                    showSelectedItems: true,
                    // itemBuilder: (context, item, isSelected) {
                    //   return SizedBox(
                    //     height: 50.0,
                    //     child: Center(
                    //       child: Text(item.name),
                    //     ),
                    //   );
                    // },
                    showSearchBox: true,
                  ),
                  compareFn: (item1, item2) => item1.name == item2.name,
                  itemAsString: (item) => item.name,
                  onChanged: (value) {
                    setState(() {
                      _selectedCountryValue = value!.name;
                    });
                  },
                  asyncItems: (filter) => getData(filter),
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
