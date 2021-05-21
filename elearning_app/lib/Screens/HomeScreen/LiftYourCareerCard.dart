import 'package:elearning_app/Screens/HomeScreen/KnowMoreButton.dart';
import 'package:elearning_app/utils/const.dart';
import 'package:flutter/material.dart';

class LiftYourCareer extends StatelessWidget {
  const LiftYourCareer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Color(0xFFFEF3F3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "Lift Your Career \nWith Us!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Constants.textDark),
              ),
              SizedBox(height: 10.0),
              KnowMoreButton()
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
