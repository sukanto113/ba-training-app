import 'package:flutter/material.dart';

class ListviewDemo3 extends StatelessWidget {
  const ListviewDemo3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.separated(
          itemCount: 200,
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemBuilder: (context, index) {
            return Text("data ${index + 1}");
          },
        ),
      ),
    );
  }
}
