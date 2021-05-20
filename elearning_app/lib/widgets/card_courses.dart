import 'package:elearning_app/utils/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardCourses extends StatefulWidget {
  final Image image;
  final String title;
  final String hours;
  final Color color;
  final Function() onPressed;

  CardCourses({
    Key? key,
    required this.image,
    required this.title,
    required this.hours,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CardCoursesState createState() => _CardCoursesState();
}

class _CardCoursesState extends State<CardCourses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.0),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: widget.color,
      ),
      child: Row(
        children: <Widget>[
          widget.image,
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constants.textDark),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  widget.hours,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Constants.textDark,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 10,
              ),
              Container(
                child: IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(Icons.keyboard_arrow_right_rounded,
                      size: 30, color: Color(0xFFF18C8E)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
