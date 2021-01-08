import 'package:flutter/material.dart';
import 'AuthPage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'TicTacToe',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            )),
            MaterialButton(
              color: Colors.redAccent,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AuthPage('Login', Colors.redAccent)));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Login',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(15))),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AuthPage('Register', Colors.blueAccent)));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Register',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(15))),
            )
          ],
        ),
      ),
    );
  }
}
