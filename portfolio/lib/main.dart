import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 400),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset('images/cloud.png')),
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        "I'm Smarajit",
                        style: TextStyle(fontSize: 70),
                      ),
                    ),
                    subtitle: Center(
                        child: Text(
                      'a web designer',
                      style: TextStyle(fontSize: 20),
                    )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 400),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset('images/cloud.png')),
                  ),
                  Image.asset('images/mountain.png'),
                  Container(
                      margin: EdgeInsets.only(top: 100),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://avatars2.githubusercontent.com/u/60264722?s=460&u=4a05c7a35dbc74834c29647e84b39df018facdde&v=4')),
                        shape: BoxShape.circle,
                      )),
                  Center(
                    child: ListTile(
                      title: Text(
                        'Smarajit Das',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      subtitle: Text(
                        'Flutter Developer || Competitive Coder || IoT and AI/ML Enthusiast || Undergrad at Malaviya National Institute of Technology, Jaipur',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  ListTile(
                    title: Text('Corona Tracker'),
                    subtitle: Text(
                        'Corona Tracker Android/Web App using Flutter SDK.'),
                  ),
                  ListTile(
                    title: Text('Automatic Plant Irrigation System'),
                    subtitle: Text(
                        'Automatic Plant Irrigation System implemented using Raspberry Pi.'),
                  ),
                  ListTile(
                    title: Text('Facial Expression Classifier'),
                    subtitle: Text(
                        'Classified Facial Expression by taking real-time data through webcam using Tensorflow library and Keras API'),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Text('Find me on'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
