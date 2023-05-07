// To see the difference run this app in a bigger screen and a small screen app.
//
// In this example, the children are spaced out equally, unless there's no more
// room, in which case they stack vertically and scroll.

import 'package:flutter/material.dart';

class SingleChildScrollViewDemo1 extends StatelessWidget {
  const SingleChildScrollViewDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(
          builder: (context, viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 300.0,
                      color: const Color(0xffeeee00),
                      alignment: Alignment.center,
                      child: const Text(
                        "Fixed Height Content",
                      ),
                    ),
                    Container(
                      height: 300.0,
                      color: const Color(0xff008000),
                      alignment: Alignment.center,
                      child: const Text(
                        "Fixed Height Content",
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
