import 'package:flutter/material.dart';

class DrawerDemo1 extends StatelessWidget {
  const DrawerDemo1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: StartDrawer(),
        endDrawer: EndDrawer(),
        appBar: AppBar(
          title: Text("Drawer Demo"),
        ),
        body: Builder(builder: (context) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Text("Open Drawer"),
                ),
                TextButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Text("Open End Drawer"),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}

class StartDrawer extends StatelessWidget {
  const StartDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text("Drawer Header")),
          ListTile(
            onTap: () {},
            title: Text("Item 1"),
          ),
          ListTile(
            onTap: () {},
            title: Text("Item 2"),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            title: Text("Close"),
          ),
        ],
      ),
    );
  }
}

class EndDrawer extends StatelessWidget {
  const EndDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text("End Header")),
          ListTile(
            onTap: () {},
            title: Text("Item 1"),
          ),
          ListTile(
            onTap: () {},
            title: Text("Item 2"),
          ),
          ListTile(
            onTap: () {},
            title: Text("Item 3"),
          ),
        ],
      ),
    );
  }
}
