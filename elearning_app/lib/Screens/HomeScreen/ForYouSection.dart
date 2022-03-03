import 'package:elearning_app/Screens/HomeScreen/ForYouCard.dart';
import 'package:flutter/material.dart';

class ForYouSection extends StatelessWidget {
  const ForYouSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ForYouCard(
            title: 'Physics',
            image: Image.asset('assets/exam.png'),
            color: Colors.lightBlue[100]!,
          ),
          ForYouCard(
            title: 'Chemistry',
            image: Image.asset('assets/currentaffairs.png'),
            color: Colors.pink[100]!,
          ),
          ForYouCard(
            title: 'Mathematics',
            image: Image.asset('assets/knowledgezone.png'),
            color: Colors.teal[100]!,
          ),
        ],
      ),
    );
  }
}
