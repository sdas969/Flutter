import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[900],
        body: SafeArea(
                  child: 
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                          color: Colors.cyan,
                          margin: EdgeInsets.all(10.0),
                          height: 100.0,
                          width: 100.0,
                          child: Center(child: Text('Container 1'),),
                      ),
                      Container(
                          color: Colors.deepOrange,
                          height: 100.0,
                          width: 100.0,
                          margin: EdgeInsets.all(10.0),
                          child: Center(child: Text('Container 2'),),
                      ),
                      Container(
                          color: Colors.red,
                          height: 100.0,
                          width: 100.0,
                          margin: EdgeInsets.all(10.0),
                          child: Center(child: Text('Container 3'),),
                      ),
                      //Container(
                      //  width: double.infinity
                      //)
                    ],
                  )
        ),
      ));
  }
}