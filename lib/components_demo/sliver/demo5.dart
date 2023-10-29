import 'package:flutter/material.dart';

class SliverDemo5 extends StatelessWidget {
  const SliverDemo5({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: Delegate(),
              pinned: true,
              floating: true,
            ),
            SliverList(
              delegate: ListDelegate(),
            )
          ],
        ),
      ),
    );
  }
}

class ListDelegate extends SliverChildDelegate {
  @override
  Widget? build(BuildContext context, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.red,
        ),
      ),
      child: Center(
        child: Text("A item"),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverChildDelegate oldDelegate) {
    return true;
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
