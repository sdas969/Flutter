import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final databaseReference = FirebaseFirestore.instance;
  void createRecord(String loc) async {
    await databaseReference
        .collection("location")
        .doc(DateTime.now().toString())
        .set({'location': loc});
  }

  void getLoc() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(position);
    createRecord(position.toString());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('App'),
        ),
        body: Container(
          child: Center(
            child: ElevatedButton(
              child: Text('Press Me'),
              onPressed: () {
                getLoc();
              },
            ),
          ),
        ),
      ),
    );
  }
}
