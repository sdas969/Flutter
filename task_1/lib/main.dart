import 'package:flutter/material.dart';
import 'package:task_1/home.dart';
import 'package:task_1/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  initShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('isLogged')) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Login()));
    }
  }

  @override
  void initState() {
    initShared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.white),
    );
  }
}
