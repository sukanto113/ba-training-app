import 'package:flutter/material.dart';

class AlertDialogDemo1 extends StatelessWidget {
  const AlertDialogDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: DemoWidget(),
      ),
    );
  }
}

class DemoWidget extends StatelessWidget {
  const DemoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        child: const Text("Show Dialog"),
        onPressed: () async {
          final answer = await showDialog<String>(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text("Title"),
                content: const Text("Description"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, "Cancle");
                    },
                    child: const Text("Cancle"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, "Ok");
                    },
                    child: const Text("Ok"),
                  ),
                ],
              );
            },
          );
          print("Answer is $answer");
        },
      ),
    );
  }
}
