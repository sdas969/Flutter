import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tictactoe/TicTacToe.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailInputController = new TextEditingController();
  TextEditingController pwdInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailInputController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
                ),
              ),
            ),
            TextField(
              controller: pwdInputController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MaterialButton(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () async {
                  await Firebase.initializeApp();
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: emailInputController.text,
                          password: pwdInputController.text)
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TicTacToe())));
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
