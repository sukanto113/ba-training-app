import 'package:flutter/material.dart';

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5
          ),
          itemCount: 40,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.teal,
              child: Center(
                child: Text("Item ${index + 1}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
