import 'package:elearning_app/Screens/LoginScreen/components/LoginBackground.dart';
import 'package:elearning_app/Screens/MainLayout/MainLayout.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/components/rounded_button.dart';
import 'package:elearning_app/components/rounded_input_field.dart';
import 'package:elearning_app/components/rounded_password_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    Key? key,
  }) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              keyboardType: TextInputType.emailAddress,
              controller: emailController,
            ),
            RoundedPasswordField(
              controller: passwordController,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainLayout()),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
