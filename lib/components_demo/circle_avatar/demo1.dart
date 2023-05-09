import 'package:flutter/material.dart';

class CircleAvatarDemo1 extends StatelessWidget {
  const CircleAvatarDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  backgroundImage: AssetImage("images/sukanto.png"),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 100,
                height: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text(
                    "SS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Chip(
                onDeleted: () {
                  
                },
                avatar: CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Text(
                    "SS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 28,
                    ),
                  ),
                ),
                label: Text("Sukanto Saha"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
