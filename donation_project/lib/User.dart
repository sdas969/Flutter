import 'package:donation_project/FormPage.dart';
import 'package:flutter/material.dart';

class User extends StatefulWidget {
  final String userType;
  User(this.userType);
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                  child: Text(
                'Blood Friends',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              )),
            ),
            MaterialButton(
              color: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(11))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FormPage(widget.userType, 'Register')));
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Hero(
                  tag: 'button1',
                  child: Text('Register',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ),
            ),
            MaterialButton(
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(11))),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FormPage(widget.userType, 'Login')));
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Hero(
                  tag: 'button2',
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
