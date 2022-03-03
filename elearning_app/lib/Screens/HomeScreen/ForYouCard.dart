import 'package:flutter/material.dart';

class ForYouCard extends StatelessWidget {
  final String title;
  final Image image;
  final Color color;
  const ForYouCard({
    required this.image,
    required this.title,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Expanded(flex: 3, child: image)
            ],
          ),
        ),
      ),
    );
  }
}
