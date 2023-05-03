import 'package:ba_training_app/simple_counter/provider/counter_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/counter_controller.dart';
import '../widgets/counter_layout.dart';
import '../widgets/counter_value.dart';

class ProviderCounterAppDemo extends StatelessWidget {
  const ProviderCounterAppDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: const MaterialApp(
        home: Scaffold(
          body: Center(child: CounterWithProvider()),
        ),
      ),
    );
  }
}

class CounterWithProvider extends StatelessWidget {
  const CounterWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return CounterAppLayout(
      counterValue: Consumer<CounterModel>(
        builder: (context, counter, child) {
          return CounterValueWidget(value: counter.currentValue);
        },
      ),
      counterController: CounterControllerWidget(
        onDecrementPressed: () {
          Provider.of<CounterModel>(context, listen: false).decrement();
        },
        onResetPressed: () {
          Provider.of<CounterModel>(context, listen: false).reset();
        },
        onIncrementPressed: () {
          Provider.of<CounterModel>(context, listen: false).increment();
        },
      ),
    );
  }
}
