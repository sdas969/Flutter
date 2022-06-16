import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';
import 'package:tezsure_task/ui/home_screen.dart';
import 'package:tezsure_task/store/tezsure_store.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(VxState(store: TezSureStore(), child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: appThemeData, home: const HomeScreen(), title: appTitle);
}
