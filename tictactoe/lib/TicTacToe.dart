import 'dart:math';

import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  var items = ['', '', '', '', '', '', '', '', ''];
  String message = '';

  void computer() {
    var compItems = [];
    for (int i = 0; i < items.length; i++) {
      if (items[i] == '') compItems.add(i);
    }
    items[compItems[Random().nextInt(compItems.length)]] = 'O';
  }

  void check() {
    if (items[0] == items[1] && items[1] == items[2]) {
      message = '${items[2]} Won';
    } else if (items[0] == items[4] && items[4] == items[8]) {
      message = '${items[8]} Won';
    } else if (items[0] == items[3] && items[3] == items[6]) {
      message = '${items[6]} Won';
    } else if (items[1] == items[4] && items[4] == items[7]) {
      message = '${items[7]} Won';
    } else if (items[2] == items[4] && items[4] == items[6]) {
      message = '${items[6]} Won';
    } else if (items[2] == items[5] && items[5] == items[8]) {
      message = '${items[8]} Won';
    } else if (items[3] == items[4] && items[4] == items[5]) {
      message = '${items[5]} Won';
    } else if (items[0] == items[3] && items[3] == items[6]) {
      message = '${items[6]} Won';
    } else if (items[6] == items[7] && items[7] == items[8]) {
      message = '${items[8]} Won';
    } else
      message = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(60),
            child: Text(
              "You are playing as X",
              style: TextStyle(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              message,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.count(
                crossAxisCount: 3,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (items[0] == '') {
                          items[0] = 'X';
                          computer();
                        }
                      });
                      check();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black),
                              right: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black))),
                      margin: const EdgeInsets.all(0.0),
                      child: Center(
                          child:
                              Text(items[0], style: TextStyle(fontSize: 50))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (items[1] == '') {
                          items[1] = 'X';
                          computer();
                        }
                      });
                      check();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black),
                              right: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black))),
                      margin: const EdgeInsets.all(0.0),
                      child: Center(
                          child:
                              Text(items[1], style: TextStyle(fontSize: 50))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (items[2] == '') {
                          items[2] = 'X';
                          computer();
                        }
                      });
                      check();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                            style: BorderStyle.solid,
                            width: 2,
                            color: Colors.black),
                      )),
                      margin: const EdgeInsets.all(0.0),
                      child: Center(
                          child:
                              Text(items[2], style: TextStyle(fontSize: 50))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (items[3] == '') {
                          items[3] = 'X';
                          computer();
                        }
                      });
                      check();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black),
                              right: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black))),
                      margin: const EdgeInsets.all(0.0),
                      child: Center(
                          child:
                              Text(items[3], style: TextStyle(fontSize: 50))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (items[4] == '') {
                          items[4] = 'X';
                          computer();
                        }
                      });
                      check();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black),
                              right: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black))),
                      margin: const EdgeInsets.all(0.0),
                      child: Center(
                          child:
                              Text(items[4], style: TextStyle(fontSize: 50))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (items[5] == '') {
                          items[5] = 'X';
                          computer();
                        }
                      });
                      check();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                            style: BorderStyle.solid,
                            width: 2,
                            color: Colors.black),
                      )),
                      margin: const EdgeInsets.all(0.0),
                      child: Center(
                          child:
                              Text(items[5], style: TextStyle(fontSize: 50))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (items[6] == '') {
                          items[6] = 'X';
                          computer();
                        }
                      });
                      check();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black))),
                      margin: const EdgeInsets.all(0.0),
                      child: Center(
                          child:
                              Text(items[6], style: TextStyle(fontSize: 50))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (items[7] == '') {
                          items[7] = 'X';
                          computer();
                        }
                      });
                      check();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  style: BorderStyle.solid,
                                  width: 2,
                                  color: Colors.black))),
                      margin: const EdgeInsets.all(0.0),
                      child: Center(
                          child:
                              Text(items[7], style: TextStyle(fontSize: 50))),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (items[8] == '') {
                          items[8] = 'O';
                          computer();
                        }
                      });
                      check();
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border(right: BorderSide.none)),
                      margin: const EdgeInsets.all(0.0),
                      child: Center(
                          child:
                              Text(items[8], style: TextStyle(fontSize: 50))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
