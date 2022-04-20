import 'dart:math';

import 'package:flutter/material.dart';
import 'package:saralbuild_task/login.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Image.asset(
                    'images/logo.png',
                    fit: BoxFit.fitWidth,
                    height: min(MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width),
                    width: min(MediaQuery.of(context).size.height,
                        MediaQuery.of(context).size.width),
                    color: Colors.white,
                  )),
              MaterialButton(
                color: Colors.blue.shade900,
                textColor: Colors.white,
                padding: const EdgeInsets.all(16),
                minWidth: double.infinity,
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Login())),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
