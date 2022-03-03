import 'dart:ui';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/1.jpeg'),
              ),
              Text(
                'Smarajit Das',
                //textScaleFactor: 1.5,
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
              Text(
                'NOOBMASTER69',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  color: Colors.teal[100],
                  fontWeight: FontWeight.w700,
                  fontSize: 15.0,
                  letterSpacing: 8.0,
                ),
                ),
              Divider(
                height: 20.0,
                endIndent: 40.0,
                indent: 40.0,
                color: Colors.white,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                margin: EdgeInsets.all(10.0),
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 70.0, 0.0),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(Icons.phone,
                    size: 30.0,
                    color: Colors.blue.shade800,),
                    Text(
                        '+91 7000482867',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.teal.shade900,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Source Sans Pro'
                        ),)
        
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                color: Colors.white,
                height: 50.0,
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 40.0, 0.0),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                  Icon(Icons.email,
                  size: 30.0,
                  color: Colors.red,),
                  Text(
                    'sdasbsp1958@gmail.com',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal.shade900,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Source Sans Pro',
                    ),
                    )
                    ]
                    )
              ),
              Container(
                width: double.infinity,
              )
            ],
            )
        ),
      ));
  }
}