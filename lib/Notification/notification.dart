import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NewNotification extends StatefulWidget {
  const NewNotification({Key? key}) : super(key: key);

  @override
  _NewNotificationState createState() => _NewNotificationState();
}

class _NewNotificationState extends State<NewNotification> {

  late final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void initState()  {
    super.initState();

    var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    tz.initializeTimeZones(); // initialize time zones here
  }

  TimeOfDay? selectedTime;
  Future<void> setAlarm() async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'channel id',
      'channel name',
      channelDescription: 'channel description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      sound: RawResourceAndroidNotificationSound('my_sound'),
    );
    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
      sound: 'my_sound.aiff',
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Alarm',
      'Wake up!',
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 2)),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  DateTime alarmTime = DateTime.now().add(const Duration(seconds: 2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("local.notification"),
        centerTitle: true,
        leading: const Icon(Icons.looks_two_outlined),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[Color(0xff00aeef), Color(0xff2d388a)]),
          ),
        ),
        // backgroundColor: Colors.transparent,
        // backgroundColor: Color.lerp(const Color(0xff00aeef), const Color(0xff2d388a),0.3)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 95),
                backgroundColor: CupertinoColors.activeOrange,
              ),
              onPressed: () async {
                setAlarm();
                selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {});
              },
              child: const Text('Pick a time'),
            ),
            const SizedBox(height: 20),
            selectedTime != null
                ? Text('Selected time: ${selectedTime!.format(context)}')
                : Container(),
          ],
        ),
      ),
    );
  }
}
