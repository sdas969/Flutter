import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';

class AccountDropdown extends StatelessWidget {
  const AccountDropdown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialButton(
      textColor: secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: buttonColor,
      onPressed: () {},
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CircleAvatar(backgroundImage: profileImage)),
            Text(accountName),
            const Icon(Icons.keyboard_arrow_down)
          ])));
}
