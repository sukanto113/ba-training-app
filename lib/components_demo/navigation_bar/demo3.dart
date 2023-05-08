// Example of NavigationBar with Stack and Offstage.
// Also with Fade Animation for Teal and Cyan Destination

import 'package:flutter/material.dart';

class NavigationBarDemo3 extends StatefulWidget {
  const NavigationBarDemo3({super.key});

  @override
  State<NavigationBarDemo3> createState() => _NavigationBarDemo3State();
}

class _NavigationBarDemo3State extends State<NavigationBarDemo3>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  late final AnimationController _tealAnimationController;
  late final Animation<double> _tealAnimation;

  late final AnimationController _cyanAnimationController;
  late final Animation<double> _cyanAnimation;

  late final Widget _tealView;
  late final Widget _cyanView;

  @override
  void initState() {
    super.initState();
    _tealAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _tealAnimation = CurvedAnimation(
      parent: _tealAnimationController,
      curve: Curves.easeIn,
    );

    _cyanAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _cyanAnimation = CurvedAnimation(
      parent: _cyanAnimationController,
      curve: Curves.easeIn,
    );

    _tealView = TealDestinationView(
      opacityAnimation: _tealAnimation,
    );

    _cyanView = CyanDestinationView(
      opacityAnimation: _cyanAnimation,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedIndex == 0) {
      _tealAnimationController.forward();
    } else {
      _tealAnimationController.reverse();
    }
    if (_selectedIndex == 1) {
      _cyanAnimationController.forward();
    } else {
      _cyanAnimationController.reverse();
    }
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
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
            if (_selectedIndex == 0)
              _tealView
            else if (_tealAnimationController.isAnimating)
              IgnorePointer(
                child: _tealView,
              )
            else
              Offstage(
                child: _tealView,
              ),
            if (_selectedIndex == 1)
              _cyanView
            else if (_cyanAnimationController.isAnimating)
              IgnorePointer(
                child: _cyanView,
              )
            else
              Offstage(
                child: _cyanView,
              ),
            Offstage(
              offstage: _selectedIndex != 2,
              child: const OrangeDestinationView(),
            ),
            Offstage(
              offstage: _selectedIndex != 3,
              child: const BlueDestinationView(),
            ),
          ],
        ),
      ),
    );
  }
}

class TealDestinationView extends StatelessWidget {
  final Animation<double> opacityAnimation;
  const TealDestinationView({
    super.key,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacityAnimation,
      child: Container(
        color: Colors.teal,
        child: const Center(
          child: Text("Teal View"),
        ),
      ),
    );
  }
}

class CyanDestinationView extends StatelessWidget {
  final Animation<double> opacityAnimation;
  const CyanDestinationView({
    super.key,
    required this.opacityAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacityAnimation,
      child: Container(
        color: Colors.cyan,
        child: const Center(
          child: Text("Cyan View"),
        ),
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
