import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  final String buttonText;
  final Color buttonColor;
  const AuthPage(this.buttonText, this.buttonColor);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
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
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    widget.buttonText,
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
