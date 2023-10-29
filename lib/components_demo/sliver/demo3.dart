import 'package:flutter/material.dart';

class SliverDemo3 extends StatelessWidget {
  const SliverDemo3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: CustomScrollView(
            slivers: [
              SliverPersistentHeader(
                delegate: Delegate(),
                pinned: true,
                floating: true,
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

class Delegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: Text("persistence header content"),
      ),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
