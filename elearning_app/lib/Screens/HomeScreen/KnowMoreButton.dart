import 'package:elearning_app/Screens/HomeScreen/category_screen.dart';
import 'package:elearning_app/utils/const.dart';
import 'package:flutter/material.dart';

class KnowMoreButton extends StatelessWidget {
  const KnowMoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      child: FlatButton(
        padding: EdgeInsets.all(10.0),
        color: Constants.salmonMain,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  "Know More",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Icon(Icons.arrow_forward, color: Colors.white, size: 16),
          ],
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(13.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryScreen()),
          );
        },
      ),
    );
  }
}
