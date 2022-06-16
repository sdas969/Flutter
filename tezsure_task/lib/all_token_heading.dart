import 'package:flutter/material.dart';
import 'package:tezsure_task/tez_bottom_sheet.dart';
import 'package:tezsure_task/constants.dart';

class AllTokenHeading extends StatefulWidget {
  const AllTokenHeading({
    Key? key,
  }) : super(key: key);

  @override
  State<AllTokenHeading> createState() => _AllTokenHeadingState();
}

class _AllTokenHeadingState extends State<AllTokenHeading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('All Tokens'),
          MaterialButton(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            color: buttonColor,
            onPressed: () => showModalBottomSheet(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30))),
                context: context,
                builder: (context) => TezBottomSheet()),
            textColor: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: const [Icon(Icons.sync), Text('Sort By')],
            ),
          )
        ],
      ),
    );
  }
}
