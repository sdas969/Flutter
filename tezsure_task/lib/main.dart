import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tezsure_task/home_screen.dart';
import 'package:tezsure_task/tezsure_store.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: TezSureStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData.dark().copyWith(
            textTheme: GoogleFonts.poppinsTextTheme()
                .apply(bodyColor: Colors.white, displayColor: Colors.white)),
        home: const HomeScreen(),
        title: 'TezSure',
      );
}
