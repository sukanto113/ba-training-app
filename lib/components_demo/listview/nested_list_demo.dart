import 'package:flutter/material.dart';

class NestedListDemo extends StatelessWidget {
  const NestedListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: CustomScrollView(slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                ListTile(title: Text("Element 1")),
                ListTile(title: Text("Element 2")),
                ListTile(title: Text("Element 3")),
              ]),
            ),
            SliverList.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Sub Element $index"),
                );
              },
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListTile(title: Text("Element 4")),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}
