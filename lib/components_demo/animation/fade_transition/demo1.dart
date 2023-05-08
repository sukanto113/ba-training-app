import 'package:flutter/material.dart';

class FadeTransitionDemo1 extends StatefulWidget {
  const FadeTransitionDemo1({super.key});

  @override
  State<FadeTransitionDemo1> createState() => _FadeTransitionDemo1State();
}

class _FadeTransitionDemo1State extends State<FadeTransitionDemo1>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.addStatusListener((status) {
      print(status);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeTransition(
                opacity: _animation,
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _controller.forward();
                    },
                    child: const Text("Forward"),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      _controller.reverse();
                    },
                    child: const Text("Reverse"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
