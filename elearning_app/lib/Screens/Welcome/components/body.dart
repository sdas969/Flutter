import 'package:elearning_app/Screens/LoginScreen/login_screen.dart';
import 'package:elearning_app/Screens/SignupScreen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:elearning_app/Screens/Welcome/components/background.dart';
import 'package:elearning_app/components/rounded_button.dart';
import 'package:elearning_app/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  late final AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return WelcomeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: size.height * 0.11,
                  width: size.width * 0.11,
                ),
                SizedBox(height: size.height * 0.05),
                LottieBuilder.asset(
                  'assets/27637-welcome.zip',
                  height: size.height * 0.45,
                  controller: controller,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    controller
                      ..duration = composition.duration
                      ..repeat();
                  },
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            Column(
              children: [
                RoundedButton(
                  color: Colors.deepPurple,
                  text: "LOGIN",
                  press: () {
                    return showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        context: context,
                        builder: (context) => LoginScreen());
                  },
                ),
                RoundedButton(
                  text: "SIGN UP",
                  color: kPrimaryLightColor,
                  textColor: Colors.black,
                  press: () {
                    return showModalBottomSheet(
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50))),
                        context: context,
                        builder: (context) => SignUpScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
