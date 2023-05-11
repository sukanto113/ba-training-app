import 'package:ba_training_app/components_demo/sqflite/db.dart';
import 'package:flutter/material.dart';

class SQFLiteDemo1 extends StatefulWidget {
  const SQFLiteDemo1({super.key});

  @override
  State<SQFLiteDemo1> createState() => _SQFLiteDemo1State();
}

class _SQFLiteDemo1State extends State<SQFLiteDemo1> {
  late final TextEditingController _controller;
  late Future<List<Todo>> _todos;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    updateTodosFromDB();
  }

  void updateTodosFromDB() {
    setState(() {
      _todos = TodoDatabase.readAll();
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
        appBar: AppBar(title: const Text("Todo")),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () async {
                        String todo = _controller.text;
                        _controller.clear();
                        FocusManager.instance.primaryFocus?.unfocus();
                        await TodoDatabase.insertTodo(todo);
                        updateTodosFromDB();
                      },
                      child: const Text("Add"),
                    ),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () async {
                  await TodoDatabase.deleteAll();
                  updateTodosFromDB();
                },
                child: const Text("Clear All"),
              ),
              Expanded(
                child: FutureBuilder(
                  future: _todos,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<Todo> todos = snapshot.data!;
                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(todos.elementAt(index).text),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
