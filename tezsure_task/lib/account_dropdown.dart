import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';

class AccountDropdown extends StatelessWidget {
  const AccountDropdown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: buttonColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/profile/profile.png')),
              ),
              Text(
                'Jon Ben',
                style: TextStyle(color: Colors.black),
              ),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
        onPressed: () {});
  }
}
