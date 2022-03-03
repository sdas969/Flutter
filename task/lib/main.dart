import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          textTheme:
              GoogleFonts.latoTextTheme().apply(bodyColor: Colors.white)),
      home: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: OnboardingSetup(),
          ),
        ),
      ),
    );
  }
}
