import 'package:flutter/material.dart';

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GridView.extent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: [
            Container(
              color: Colors.teal,
              child: Center(
                child: Text("Item 1"),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Center(
                child: Text("Item 2"),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Center(
                child: Text("Item 3"),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Center(
                child: Text("Item 4"),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Center(
                child: Text("Item 5"),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Center(
                child: Text("Item 6"),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Center(
                child: Text("Item 7"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
