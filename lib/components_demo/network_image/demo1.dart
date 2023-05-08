import 'package:flutter/material.dart';

class NetworkImageDemo1 extends StatelessWidget {
  const NetworkImageDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 200,
            child: Image(
              image: NetworkImage(
                "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
              ),
            ),
          ),
        ),
      ),
    );
  }
}
