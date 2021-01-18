import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [Text('Made By Smarajit Das')],
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Center(
                child: Text(
              'Cough Classifier',
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.w100),
            )),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Hero(
                    tag: 'rec',
                    child: MaterialButton(
                      elevation: 20,
                      disabledElevation: 10,
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Icon(
                          Icons.code_rounded,
                          size: 50,
                        ),
                      ),
                      onPressed: () {},
                      disabledColor: Colors.blueAccent.shade100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: Hero(
                    tag: 'play',
                    child: MaterialButton(
                      color: Colors.pinkAccent,
                      elevation: 20,
                      disabledElevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        child: Icon(
                          Icons.api,
                          size: 50,
                        ),
                      ),
                      onPressed: () {},
                      disabledColor: Colors.pinkAccent.shade100,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 56,
            ),
          ],
        ),
      ),
    );
  }
}
