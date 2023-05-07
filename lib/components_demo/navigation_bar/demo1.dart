import 'package:flutter/material.dart';

class NavtgationBarDemo1 extends StatefulWidget {
  const NavtgationBarDemo1({super.key});

  @override
  State<NavtgationBarDemo1> createState() => _NavtgationBarDemo1State();
}

class _NavtgationBarDemo1State extends State<NavtgationBarDemo1> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            NavigationDestination(
              icon: Icon(Icons.commute),
              selectedIcon: Icon(Icons.commute_outlined),
              label: "Commute",
            ),
            NavigationDestination(
              icon: Icon(Icons.bookmark_outline),
              selectedIcon: Icon(Icons.bookmark),
              label: "Saved",
            ),
          ],
          selectedIndex: _selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              _selectedIndex = value;
            });
          },
        ),
        body: [
          Container(
            color: Colors.red,
            alignment: Alignment.center,
            child: const Text("Page 1"),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: const Text("Page 2"),
          ),
          Container(
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text("Page 3"),
          )
        ][_selectedIndex],
      ),
    );
  }
}
