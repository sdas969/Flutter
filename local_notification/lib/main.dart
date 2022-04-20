import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:local_notification/createNote/add_30min_note.dart';
import 'package:local_notification/createNote/add_custom_note.dart';
import 'package:local_notification/notification_service.dart';
import 'package:local_notification/objectbox.dart';
import 'package:local_notification/objectbox.g.dart';
import 'package:local_notification/schema.dart';
import 'notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().init();
  objectbox = await ObjectBox.create();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Repeater',
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
              color: Colors.indigo.shade900,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20)))),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.indigo.shade900)),
      home: const MyHomePage(title: 'Notification Repeater'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NotificationService _notificationService = NotificationService();
  Store store = objectbox.store;
  int count = 0;
  bool hasBeenInitialized = false;
  bool currentValue = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          activeIcon: Icons.close,
          icon: Icons.create,
          children: [
            SpeedDialChild(
                child: const Icon(Icons.replay_30),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Add30MinNote()))),
            SpeedDialChild(
                child: const Icon(Icons.add),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddCustomNote())))
          ],
        ),
        appBar: AppBar(
          actions: [
            Switch(
                value: currentValue,
                onChanged: (value) async {
                  if (!value) {
                    _notificationService.cancelAllNotifications();
                  } else {
                    Query<Note> query =
                        objectbox.store.box<Note>().query().build();
                    List<Note> notes = query.find();
                    Future.forEach(notes, (Note note) async {
                      String starttime = note.startTime;

                      print(note.startTime);
                      print(note.endTime);
                      String ampmStart = starttime.split(' ')[1];
                      List<String> actStartTime =
                          starttime.split(' ')[0].split(':');
                      DateTime startTime = note.date;
                      startTime = startTime.add(Duration(
                          hours: ampmStart == 'AM'
                              ? int.parse(actStartTime[0])
                              : int.parse(actStartTime[0]) + 12,
                          minutes: int.parse(actStartTime[1])));

                      String endtime = note.endTime;
                      String ampmEnd = endtime.split(' ')[1];
                      List<String> actEndTime =
                          endtime.split(' ')[0].split(':');
                      DateTime endTime = note.date;
                      endTime = endTime.add(Duration(
                          hours: ampmEnd == 'AM'
                              ? int.parse(actEndTime[0])
                              : int.parse(actEndTime[0]),
                          minutes: int.parse(actEndTime[1])));

                      print(startTime);
                      print(endTime);
                      int count = 0;
                      while (startTime.compareTo(endTime) != 1) {
                        print(startTime.toString());
                        print(endTime.toString());
                        tz.TZDateTime dateTime = tz.TZDateTime.parse(
                            tz.local, startTime.toString().split('.')[0]);
                        print(dateTime);
                        await _notificationService.scheduleNotifications(
                            dateTime: dateTime,
                            id: note.id + count,
                            message: note.text);

                        switch (note.unit) {
                          case 'Hours':
                            startTime =
                                startTime.add(Duration(hours: note.interval));
                            break;

                          case 'Minutes':
                            startTime =
                                startTime.add(Duration(minutes: note.interval));
                            break;

                          case 'Seconds':
                            startTime =
                                startTime.add(Duration(seconds: note.interval));
                            break;

                          default:
                            break;
                        }
                        count++;
                      }
                    });
                    query.close();
                  }

                  setState(() {
                    currentValue = value;
                  });
                })
          ],
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: StreamBuilder(
              stream: store
                  .box<Note>()
                  .query()
                  .watch(triggerImmediately: true)
                  .map((query) => query.find()),
              builder: (context, AsyncSnapshot<List<Note>> snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) => ListTile(
                              trailing: IconButton(
                                  color: Colors.white,
                                  onPressed: () => store
                                      .box<Note>()
                                      .remove(snapshot.data![index].id),
                                  icon: const Icon(
                                    Icons.delete,
                                  )),
                              title: Text(snapshot.data![index].text),
                              isThreeLine: true,
                              subtitle: Text('Date: ' +
                                  snapshot.data![index].date
                                      .toString()
                                      .split(' ')[0] +
                                  '\nStarts at: ${snapshot.data![index].startTime}\n' +
                                  'Ends at: ${snapshot.data![index].endTime}'
                                      '\nRepeat: ${snapshot.data![index].interval} ' +
                                  snapshot.data![index].unit),
                            ));
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      Icon(
                        Icons.add,
                        size: 100,
                      ),
                      Text(
                        'Please add some notes...',
                        textAlign: TextAlign.center,
                      )
                    ],
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ) // Container(
        //     margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //     child: Center(
        //       child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [
        //           MaterialButton(
        //             child: const Text('Show Notification'),
        //             padding: const EdgeInsets.all(10),
        //             onPressed: () async {
        //               Timer.periodic(const Duration(seconds: 1), (e) async {
        //                 await _notificationService.showNotifications(count);
        //                 count++;
        //               });
        //             },
        //           ),
        //           const SizedBox(height: 3),
        //           MaterialButton(
        //             child: const Text('Schedule Notification'),
        //             padding: const EdgeInsets.all(10),
        //             onPressed: () async {
        //               await _notificationService.scheduleNotifications();
        //             },
        //           ),
        //           const SizedBox(height: 3),
        //           MaterialButton(
        //             child: const Text('Cancel Notification'),
        //             padding: const EdgeInsets.all(10),
        //             onPressed: () async {
        //               await _notificationService.cancelNotifications(0);
        //             },
        //           ),
        //           const SizedBox(height: 3),
        //           MaterialButton(
        //             child: const Text('Cancel All Notifications'),
        //             padding: const EdgeInsets.all(10),
        //             onPressed: () async {
        //               await _notificationService.cancelAllNotifications();
        //             },
        //           ),
        //           MaterialButton(
        //             child: const Text('Repeat Notification'),
        //             padding: const EdgeInsets.all(10),
        //             onPressed: () async {
        //               await _notificationService.repeatNotifications();
        //             },
        //           ),
        //           const SizedBox(height: 3),
        //         ],
        //       ),
        //     )));
        );
  }
}
