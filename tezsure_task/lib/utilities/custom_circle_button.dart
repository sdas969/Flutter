import 'package:flutter/material.dart';

class CustomCircleButton extends StatelessWidget {
  const CustomCircleButton(
      {Key? key,
      required this.iconData,
      required this.label,
      required this.onPressed})
      : super(key: key);
  final IconData iconData;
  final String label;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(onPressed: onPressed, icon: Icon(iconData))),
        const SizedBox(height: 10),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w700))
      ]));
}
