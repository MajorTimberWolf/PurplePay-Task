import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';



void main() {
  AwesomeNotifications().initialize(
    'resource://drawable/res_noti_icon',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notifications',
        channelDescription: 'Basic Notifications will be displayed',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: false,
        )
      ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );//MaterialApp
  }
}