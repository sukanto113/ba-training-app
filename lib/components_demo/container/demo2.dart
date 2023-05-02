import 'package:flutter/material.dart';

class ContainerDemo2 extends StatelessWidget {
  const ContainerDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("App Bar")),
        body: Container(
          constraints: BoxConstraints.expand(
            height:
                Theme.of(context).textTheme.headlineMedium!.fontSize! * 1.1 +
                    200.0,
          ),
          alignment: Alignment.center,
          transform: Matrix4.rotationZ(0.1),
          color: Colors.blue[600],
          child: Text(
            "Hello World",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
