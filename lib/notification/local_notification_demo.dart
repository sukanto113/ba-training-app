import 'package:ba_training_app/notification/notification_services.dart';
import 'package:flutter/material.dart';

class LocalNotificationDemo extends StatefulWidget {
  const LocalNotificationDemo({super.key});

  @override
  State<LocalNotificationDemo> createState() => _LocalNotificationDemoState();
}

class _LocalNotificationDemoState extends State<LocalNotificationDemo> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: _LocalNotificationDemoBody(),
    );
  }
}

class _LocalNotificationDemoBody extends StatefulWidget {
  const _LocalNotificationDemoBody({
    super.key,
  });

  @override
  State<_LocalNotificationDemoBody> createState() =>
      _LocalNotificationDemoBodyState();
}

class _LocalNotificationDemoBodyState
    extends State<_LocalNotificationDemoBody> {
  NotificationServices notificationServices = NotificationServices();
  final scheduleTime = DateTime(2023, 10, 25, 13, 20, 0);
  @override
  void initState() {
    super.initState();
    notificationServices.initializedNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print("show notification button clicked");
                notificationServices.showNotification(
                  title: "title",
                  body: "body",
                );
              },
              child: Text("Show Notificaiton"),
            ),
            ElevatedButton(
              onPressed: () {
                notificationServices.seheduleNotification(
                  DateTime.now().add(const Duration(seconds: 10)),
                );
              },
              child: Text("Schedule Notificaiton"),
            ),
            ElevatedButton(
              onPressed: () {
                notificationServices.cancleAllNotifications();
              },
              child: Text("Cancle all notificaitons"),
            ),
            ElevatedButton(
              onPressed: () {
                notificationServices.printNotifications();
              },
              child: Text("print notifications"),
            ),
          ],
        ),
      ),
    );
  }
}
