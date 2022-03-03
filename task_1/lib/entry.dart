import 'package:flutter/material.dart';
import 'package:task_1/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class Entry extends StatefulWidget {
  final TextEditingController usernameEditingController;
  final TextEditingController passwordEditingController;
  const Entry(
      {Key? key,
      required this.usernameEditingController,
      required this.passwordEditingController})
      : super(key: key);

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  setStatus() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isLogged', true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Username',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Material(
              elevation: 10,
              shape: roundedRectangleBorder,
              child: TextField(
                controller: widget.usernameEditingController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Enter Username',
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade900, width: 2),
                        borderRadius: BorderRadius.circular(100)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100))),
                keyboardType: TextInputType.text,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Password',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Material(
              elevation: 10,
              shape: roundedRectangleBorder,
              child: TextField(
                controller: widget.passwordEditingController,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.password),
                    hintText: 'Enter Password',
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue.shade900, width: 2),
                        borderRadius: BorderRadius.circular(100)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100))),
                keyboardType: TextInputType.text,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        MaterialButton(
          color: Colors.blue.shade900,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          shape: roundedRectangleBorder,
          onPressed: () async {
            if (widget.usernameEditingController.text == 'admin' &&
                widget.passwordEditingController.text == '1234') {
              await setStatus();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            } else {
              showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                        content: Text('Incorrect Username or Password'),
                      ));
            }
          },
        )
      ],
    );
  }
}
