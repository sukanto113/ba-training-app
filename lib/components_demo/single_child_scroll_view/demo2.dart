// ensure that the column becomes either as big as viewport, or as big as the
// contents, whichever is biggest.
import 'package:flutter/material.dart';

class SingleChildScrollViewDemo2 extends StatelessWidget {
  const SingleChildScrollViewDemo2({super.key});

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
                child: IntrinsicHeight(
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
                      Expanded(
                        child: Container(
                          height: 300.0,
                          color: const Color(0xff008000),
                          alignment: Alignment.center,
                          child: const Text(
                            "Fixed Height Content",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
