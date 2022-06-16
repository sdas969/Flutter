import 'package:flutter/material.dart';
import 'package:tezsure_task/utilities/sortby_button.dart';

class AllTokenHeading extends StatefulWidget {
  const AllTokenHeading({
    Key? key,
  }) : super(key: key);

  @override
  State<AllTokenHeading> createState() => _AllTokenHeadingState();
}

class _AllTokenHeadingState extends State<AllTokenHeading> {
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Text('All Tokens'), SortByButton()]));
}
