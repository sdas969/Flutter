import 'package:flutter/material.dart';
import 'package:saralbuild_task/welcome.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
          snackBarTheme: const SnackBarThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20)))),
          appBarTheme: AppBarTheme(
              color: Colors.blue.shade900,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20)))),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blue.shade900,
              foregroundColor: Colors.white)),
      home: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const WelcomePage();
  }
}
