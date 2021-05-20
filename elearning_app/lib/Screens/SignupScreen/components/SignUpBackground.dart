import 'package:flutter/material.dart';

class SignUpBackground extends StatefulWidget {
  final Widget child;
  const SignUpBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _SignUpBackgroundState createState() => _SignUpBackgroundState();
}

class _SignUpBackgroundState extends State<SignUpBackground> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      // Here i can use size.width but use double.infinity because both work as a same
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50)),
              child: Image.asset(
                "assets/images/signup_top.png",
                width: size.width * 0.3,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/main_bottom.png",
              width: size.width * 0.3,
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
