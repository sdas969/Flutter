import 'package:elearning_app/Screens/Welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:lottie/lottie.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  var imgList = [
    [
      'assets/1.',
      'Online Tests',
      'Take a test to know your areas of strengths and weaknesses.',
      1
    ],
    [
      'assets/2.',
      'Knowledge Zone',
      'Explore to learn current affairs and tips and tricks to score well in your exams.',
      2
    ],
    [
      'assets/3.',
      'Quiz',
      'Rack your brain with our Quiz. Latest patter and advanced difficulty level based questions.',
      3
    ],
    [
      'assets/4.',
      'Discuss',
      'Get connected with different users of the app, discuss your doubts & share your solutions.',
      4
    ]
  ];
  @override
  void initState() {
    controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroViewsFlutter(
        imgList
            .map((e) => PageViewModel(
                  pageBackground: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: (e[3] == 1)
                            ? Alignment.centerLeft
                            : (e[3] == 2)
                                ? Alignment.topCenter
                                : (e[3] == 3)
                                    ? Alignment.centerRight
                                    : Alignment.bottomCenter,
                        end: (e[3] == 1)
                            ? Alignment.centerRight
                            : (e[3] == 2)
                                ? Alignment.bottomCenter
                                : (e[3] == 3)
                                    ? Alignment.centerLeft
                                    : Alignment.topCenter,
                        colors: [
                          Colors.purple,
                          Colors.blue,
                        ],
                      ),
                    ),
                  ),
                  iconImageAssetPath: '${e[0]}png',
                  body: Text(
                    '${e[2]}',
                  ),
                  title: FittedBox(child: Text('${e[1]}')),
                  mainImage: Lottie.asset('${e[0]}zip',
                      alignment: Alignment.center,
                      controller: controller, onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    controller
                      ..duration = composition.duration
                      ..repeat();
                  }),
                  titleTextStyle: TextStyle(color: Colors.white),
                  bodyTextStyle: TextStyle(color: Colors.white),
                ))
            .toList(),
        columnMainAxisAlignment: MainAxisAlignment.center,
        showSkipButton: false,
        showNextButton: false,
        pageButtonTextSize: 20,
        pageButtonsColor: Colors.white,
        doneText: Text('Get Started'),
        onTapDoneButton: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => WelcomeScreen()));
        },
      ),
    );
  }
}
