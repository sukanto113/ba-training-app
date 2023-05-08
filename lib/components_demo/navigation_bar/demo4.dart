// Example of NavigationBar with Stack and Offstage.
// Also with Fade Animation for all Destination.

import 'package:flutter/material.dart';

class NavigationBarDemo4 extends StatefulWidget {
  const NavigationBarDemo4({super.key});

  @override
  State<NavigationBarDemo4> createState() => _NavigationBarDemo4State();
}

class _NavigationBarDemo4State extends State<NavigationBarDemo4>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<NavigationDestination> _navigationDestinations = const [
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
  ];
  late final List<AnimationController> _opacityAnimationControllers;
  late final List<Animation<double>> _opacityAnimations;
  late final List<Widget> _destinationViews;

  @override
  void initState() {
    super.initState();
    _opacityAnimationControllers = List<AnimationController>.generate(
      4,
      (index) => AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      ),
    );

    _opacityAnimations = List<Animation<double>>.generate(
      4,
      (index) => CurvedAnimation(
        parent: _opacityAnimationControllers[index],
        curve: Curves.easeIn,
      ),
    );

    _destinationViews = [
      DestinationView(
        opacityAnimation: _opacityAnimations[0],
        child: const CenterTextWithBackgroundColor(
          color: Colors.teal,
          text: "Teal View",
        ),
      ),
      DestinationView(
        opacityAnimation: _opacityAnimations[1],
        child: const CenterTextWithBackgroundColor(
          color: Colors.cyan,
          text: "Cyan View",
        ),
      ),
      DestinationView(
        opacityAnimation: _opacityAnimations[2],
        child: const CenterTextWithBackgroundColor(
          color: Colors.orange,
          text: "Orange View",
        ),
      ),
      DestinationView(
        opacityAnimation: _opacityAnimations[3],
        child: const CenterTextWithBackgroundColor(
          color: Colors.blue,
          text: "Blue View",
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedIndex: _selectedIndex,
          destinations: _navigationDestinations,
        ),
        body: Stack(
          children: List<Widget>.generate(4, (index) {
            if (_selectedIndex == index) {
              _opacityAnimationControllers[index].forward();
            } else {
              _opacityAnimationControllers[index].reverse();
            }

            if (_selectedIndex == index) {
              return _destinationViews[index];
            } else if (_opacityAnimationControllers[index].isAnimating) {
              return IgnorePointer(
                child: _destinationViews[index],
              );
            } else {
              return Offstage(
                child: _destinationViews[index],
              );
            }
          }),
        ),
      ),
    );
  }
}

class CenterTextWithBackgroundColor extends StatelessWidget {
  final String text;
  final Color color;
  const CenterTextWithBackgroundColor({
    super.key,
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(text),
      ),
    );
  }
}

class DestinationView extends StatelessWidget {
  final Animation<double> opacityAnimation;
  final Widget child;
  const DestinationView({
    super.key,
    required this.opacityAnimation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacityAnimation,
      child: child,
    );
  }
}
