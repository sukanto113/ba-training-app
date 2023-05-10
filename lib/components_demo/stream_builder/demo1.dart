import 'dart:async';
import 'package:flutter/material.dart';

class StreamBuilderDemo1 extends StatefulWidget {
  const StreamBuilderDemo1({super.key});

  @override
  State<StreamBuilderDemo1> createState() => _StreamBuilderDemo1State();
}

class _StreamBuilderDemo1State extends State<StreamBuilderDemo1> {
  late Stream<int> _timerStream;
  late StreamController<int> _controller;
  int _time = 0;

  @override
  void initState() {
    super.initState();
    _setCounterStream();
  }

  void _setCounterStream() {
    _controller = StreamController<int>(
      onListen: () async {
        while (!_controller.isClosed) {
          _controller.add(++_time);
          await Future.delayed(const Duration(seconds: 1));
        }
      },
    );
    _timerStream = _controller.stream;
  }

  void _restartCounterStream() {
    _time = 0;
    _controller.add(_time);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: _timerStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  if (snapshot.hasData) {
                    return Text(
                      '${snapshot.data}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return const Text("Loading");
                },
              ),
              ElevatedButton(
                onPressed: _restartCounterStream,
                child: const Text("Restart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
