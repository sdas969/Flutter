import 'package:elearning_app/Screens/SignupScreen/components/SignUpBackground.dart';
import 'package:elearning_app/Screens/SignupScreen/components/or_divider.dart';
import 'package:elearning_app/Screens/SignupScreen/components/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/components/rounded_button.dart';
import 'package:elearning_app/components/rounded_input_field.dart';
import 'package:elearning_app/components/rounded_password_field.dart';

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    fullnameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SignUpBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              keyboardType: TextInputType.name,
              hintText: "Full Name",
              controller: fullnameController,
            ),
            RoundedInputField(
              keyboardType: TextInputType.emailAddress,
              hintText: "Your Email",
              icon: Icons.email,
              controller: emailController,
            ),
            RoundedPasswordField(
              controller: passwordController,
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                  key: Key('1'),
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                  key: Key('2'),
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                  key: Key('3'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
