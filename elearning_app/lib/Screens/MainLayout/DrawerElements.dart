import 'package:flutter/material.dart';

class DrawerElements extends StatelessWidget {
  const DrawerElements({
    Key? key,
    required this.drawerElements,
  }) : super(key: key);

  final List<StatelessWidget> drawerElements;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: drawerElements,
          ),
        ),
      ),
    );
  }
}
