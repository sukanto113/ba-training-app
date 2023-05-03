import 'package:flutter/material.dart';

import '../widgets/counter_controller.dart';
import '../widgets/counter_layout.dart';
import '../widgets/counter_value.dart';
import 'counter_bloc.dart';


class BlocCounterAppDemo extends StatelessWidget {
  const BlocCounterAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        body: Center(child: CounterWithBloc()),
      ),
    );
  }
}

class CounterWithBloc extends StatelessWidget {
  final CounterBloc _counterBloc = CounterBloc();
  CounterWithBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CounterAppLayout(
      counterValue: StreamBuilder(
        stream: _counterBloc.counterStream,
        initialData: 0,
        builder: (context, snapshot) {
          return CounterValueWidget(value: snapshot.data);
        },
      ),
      counterController: CounterControllerWidget(
        onDecrementPressed: () {
          _counterBloc.eventSink.add(CounterEvent.decrement);
        },
        onResetPressed: () {
          _counterBloc.eventSink.add(CounterEvent.reset);
        },
        onIncrementPressed: () {
          _counterBloc.eventSink.add(CounterEvent.increment);
        },
      ),
    );
  }
}