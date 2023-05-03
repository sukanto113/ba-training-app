import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/counter_controller.dart';
import '../widgets/counter_layout.dart';
import '../widgets/counter_value.dart';
import 'counter_bloc.dart';

class FlutterBlocCounterAppDemo extends StatelessWidget {
  const FlutterBlocCounterAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(child: CounterWithFlutterBloc()),
        ),
      ),
    );
  }
}

class CounterWithFlutterBloc extends StatelessWidget {
  const CounterWithFlutterBloc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CounterAppLayout(
      counterValue: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return CounterValueWidget(value: state);
        },
      ),
      counterController: CounterControllerWidget(
        onDecrementPressed: () {
          BlocProvider.of<CounterBloc>(context).add(CounterDecrementPressed());
        },
        onResetPressed: () {
          BlocProvider.of<CounterBloc>(context).add(CounterResetPressed());
        },
        onIncrementPressed: () {
          BlocProvider.of<CounterBloc>(context).add(CounterIncrementPressed());
        },
      ),
    );
  }
}
