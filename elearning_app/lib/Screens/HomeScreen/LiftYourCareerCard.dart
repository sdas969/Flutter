import 'package:elearning_app/Screens/HomeScreen/KnowMoreButton.dart';
import 'package:elearning_app/utils/const.dart';
import 'package:flutter/material.dart';

class LiftYourCareer extends StatelessWidget {
  LiftYourCareer({
    Key? key,
  }) : super(key: key);
  BoxDecoration _boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(30.0),
    color: Color(0xFFFEF3F3),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(30.0),
          decoration: _boxDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //Text Section
              Text(
                "Lift Your Career \nWith Us!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Constants.textDark),
              ),
              SizedBox(height: 10.0),
              KnowMoreButton() //Know More Button
            ],
          ),
        ),

        // Image Researching Girl
        Positioned(
          right: 0,
          bottom: 0,
          child: Image.asset(
            "assets/images/researching.png",
            width: 200,
            height: 104,
          ),
        ),
      ],
    );
  }
}
