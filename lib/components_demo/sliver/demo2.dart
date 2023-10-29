import 'package:flutter/material.dart';

class SliverDemo2 extends StatelessWidget {
  const SliverDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text("Flutter sliver demo"),
                expandedHeight: 300,
                stretch: true,
                flexibleSpace: Center(
                  child: Text("Center Element"),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("item $index"),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
