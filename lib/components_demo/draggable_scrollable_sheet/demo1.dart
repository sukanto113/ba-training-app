import 'package:flutter/material.dart';

class DraggableScrollableSheetDemo extends StatelessWidget {
  const DraggableScrollableSheetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Text("This draggable scrollable demo"),
            Expanded(
              child: DraggableScrollableSheet(
                initialChildSize: .4,
                minChildSize: .2,
                maxChildSize: .8,
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    controller: scrollController,
                    child: Container(height: 1000, color: Colors.red, child: Center(child: Text("content"),),),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
