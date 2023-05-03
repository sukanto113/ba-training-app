import 'dart:async';

enum CounterEvent {
  increment,
  decrement,
  reset,
}

class CounterBloc {
  final StreamController<int> _counterStateStreamController =
      StreamController<int>.broadcast();
  StreamSink<int> get _counterSink => _counterStateStreamController.sink;
  Stream<int> get counterStream => _counterStateStreamController.stream;

  final StreamController<CounterEvent> _eventStateStreamController =
      StreamController<CounterEvent>();
  StreamSink<CounterEvent> get eventSink => _eventStateStreamController.sink;
  Stream<CounterEvent> get _eventStream => _eventStateStreamController.stream;

  int _counter = 0;

  CounterBloc() {
    _eventStream.listen((event) {
      switch (event) {
        case CounterEvent.increment:
          _counter++;
          break;
        case CounterEvent.decrement:
          _counter--;
          break;
        case CounterEvent.reset:
          _counter = 0;
          break;
        default:
      }
      _counterSink.add(_counter);
    });
  }
}
