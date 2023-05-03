import 'package:flutter/material.dart';

class RenderingProblemDemo2 extends StatelessWidget {
  const RenderingProblemDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: const [
                Text(" Item 1 "),
                Text(" Item 2 "),
                Text(" Item 3 "),
                Text(" Item 4 "),
                Text(" Item 5 "),
                Text(" Item 6 "),
                Text(" Item 7 "),
                Text(" Item 8 "),
                Text(" Item 9 "),
                Text(" Item 10 "),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Text(" Item 1 "),
                  Text(" Item 2 "),
                  Text(" Item 3 "),
                  Text(" Item 4 "),
                  Text(" Item 5 "),
                  Text(" Item 6 "),
                  Text(" Item 7 "),
                  Text(" Item 8 "),
                  Text(" Item 9 "),
                  Text(" Item 10 "),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
