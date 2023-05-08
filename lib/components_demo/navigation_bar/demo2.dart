// Example of NavigationBar with Stack and Offstage

import 'package:flutter/material.dart';

class NavigationBarDemo2 extends StatefulWidget {
  const NavigationBarDemo2({super.key});

  @override
  State<NavigationBarDemo2> createState() => _NavigationBarDemo2State();
}

class _NavigationBarDemo2State extends State<NavigationBarDemo2> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
              print(_selectedIndex);
            });
          },
          selectedIndex: _selectedIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: Colors.teal,
              ),
              selectedIcon: Icon(
                Icons.home,
                color: Colors.teal,
              ),
              label: "Teal",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.business_outlined,
                color: Colors.cyan,
              ),
              selectedIcon: Icon(
                Icons.business,
                color: Colors.cyan,
              ),
              label: "Cyan",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.school,
                color: Colors.orange,
              ),
              icon: Icon(
                Icons.school_outlined,
                color: Colors.orange,
              ),
              label: "Orange",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.flight,
                color: Colors.blue,
              ),
              icon: Icon(
                Icons.flight_outlined,
                color: Colors.blue,
              ),
              label: "Blue",
            ),
          ],
        ),
        body: Stack(
          children: [
            Offstage(
              offstage: _selectedIndex != 0,
              child: TealDestinationView(),
            ),
            Offstage(
              offstage: _selectedIndex != 1,
              child: CyanDestinationView(),
            ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: OrangeDestinationView(),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: BlueDestinationView(),
            ),
          ],
        ),
      ),
    );
  }
}

class TealDestinationView extends StatelessWidget {
  const TealDestinationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: const Center(
        child: Text("Teal View"),
      ),
    );
  }
}

class CyanDestinationView extends StatelessWidget {
  const CyanDestinationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      child: const Center(
        child: Text("Cyan View"),
      ),
    );
  }
}

class OrangeDestinationView extends StatelessWidget {
  const OrangeDestinationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: const Center(
        child: Text("Orange View"),
      ),
    );
  }
}

class BlueDestinationView extends StatelessWidget {
  const BlueDestinationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: const Center(
        child: Text("Blue View"),
      ),
    );
  }
}
