import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

const String imageUrl =
    "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg";

class CachedNetworkImageDemo1 extends StatelessWidget {
  const CachedNetworkImageDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 200,
            width: 200,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              placeholder: (context, url) => const Center(
                child: SizedBox.square(
                  dimension: 50,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
