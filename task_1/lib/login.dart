import 'package:flutter/material.dart';
import 'package:task_1/entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _usernameEditingController;
  late TextEditingController _passwordEditingController;

  @override
  void initState() {
    _usernameEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  setStatus() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isLogged', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: OrientationBuilder(
            builder: ((context, orientation) =>
                orientation == Orientation.portrait
                    ? SingleChildScrollView(
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                width: 1000,
                                image: AssetImage('images/logo.png'),
                              ),
                              Expanded(
                                child: Entry(
                                    usernameEditingController:
                                        _usernameEditingController,
                                    passwordEditingController:
                                        _passwordEditingController),
                              ),
                            ],
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        child: IntrinsicHeight(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Expanded(
                                child: Image(
                                  width: 100,
                                  image: AssetImage('images/logo.png'),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Entry(
                                      usernameEditingController:
                                          _usernameEditingController,
                                      passwordEditingController:
                                          _passwordEditingController)),
                            ],
                          ),
                        ),
                      )),
          ),
        ),
      ),
    );
  }
}
