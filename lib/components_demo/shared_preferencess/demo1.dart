import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesDemo1 extends StatefulWidget {
  const SharedPreferencesDemo1({super.key});

  @override
  State<SharedPreferencesDemo1> createState() => _SharedPreferencesDemo1State();
}

class _SharedPreferencesDemo1State extends State<SharedPreferencesDemo1> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    restoreCounterValue();
  }

  Future<void> saveCounterValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("value", count);
  }

  Future<void> restoreCounterValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      count = prefs.getInt("value") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count++;
              saveCounterValue();
            });
          },
          child: const Icon(Icons.add),
        ),
        body: Center(
          child: Text(
            "$count",
            style: const TextStyle(fontSize: 80),
          ),
        ),
      ),
    );
  }
}
