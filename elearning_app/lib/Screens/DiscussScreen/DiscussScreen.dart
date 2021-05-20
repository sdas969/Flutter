import 'package:accordion/accordion.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DiscussScreen extends StatefulWidget {
  @override
  _DiscussScreenState createState() => _DiscussScreenState();
}

class _DiscussScreenState extends State<DiscussScreen> {
  bool collapsed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: SafeArea(
        child: Center(
          child: ListView(
            padding: EdgeInsets.all(11),
            children: [
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
              CustomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(11),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 20)
          ]),
      child: ExpansionTile(
        collapsedBackgroundColor: Colors.blueGrey[100],
        backgroundColor: Colors.blueGrey,
        tilePadding: EdgeInsets.all(10),
        textColor: Colors.white,
        leading: Icon(Icons.person),
        subtitle: Text('By ' + 'Hello'),
        title: Text('Problem Title'),
        collapsedIconColor: Colors.black,
        iconColor: Colors.white,
        childrenPadding: EdgeInsets.all(11),
        maintainState: true,
        children: [
          Text(
            'Problem vxvxvxcv xv xcvxcvxcD escriptionjzdvdsbd jhbsdbdsjhbdjvdjhvdjdsvjdsvbjsdvjshdvsdjhvbjsdvjsdvjsvjsdvsjdhv',
            style: TextStyle(color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.question_answer,
                        color: Colors.white,
                      ),
                      label: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.white,
                      ),
                      label: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.white,
                      ),
                      label: Text(
                        '2',
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
