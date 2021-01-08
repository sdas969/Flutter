import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text('TicTacToe'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.circle,
                    size: 80,
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.circle,
                    size: 80,
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.circle,
                    size: 80,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.circle,
                    size: 80,
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.circle,
                    size: 80,
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.circle,
                    size: 80,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.circle,
                    size: 80,
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.circle,
                    size: 80,
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.circle,
                    size: 80,
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
