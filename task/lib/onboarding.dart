import 'package:flutter/material.dart';
import 'package:task/homeScreen.dart';
import 'package:lottie/lottie.dart';

class PageContent {
  final String path;
  final String content;
  PageContent(this.path, this.content);
}

class OnboardingSetup extends StatefulWidget {
  const OnboardingSetup({
    Key? key,
  }) : super(key: key);

  @override
  State<OnboardingSetup> createState() => _OnboardingSetupState();
}

class _OnboardingSetupState extends State<OnboardingSetup> {
  late PageController _pageController;
  late bool _isLast;
  late List<PageContent> _contentList;

  @override
  void initState() {
    _pageController = PageController();
    _isLast = false;
    _contentList = [
      PageContent('lottie/yoga.json',
          'HabitUp is an intelligent habit tracking assistant designed to remind, motivate and help our users meet their habit building goals through the use of scientific methods and AI.'),
      PageContent('lottie/gtd.json',
          'A cue to a habit can be anything; it can be a place, an experience or even a feeling. It is what triggers the habit. There are numerous examples where a person smokes just because they are bored. The feeling of boredom was the trigger here; it is the cue. It is essential to experiment with your habits and isolate the cue. Often, it is the hardest to do.'),
      PageContent('lottie/calendarTrack.json',
          'The framework of the habit loop is very effective, and it only works to replace habits, not to create new ones. Now that you have an understanding of how habits work, we’ll be able to inculcate this knowledge to stick to our New Year’s resolutions and maybe, just maybe, replace the habit of stressing about covid-19 with doing something productive!')
    ];
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: OrientationBuilder(
              builder: (context, orientation) => PageView(
                onPageChanged: (pageNum) {
                  setState(() {
                    _isLast = pageNum == _contentList.length - 1;
                  });
                },
                controller: _pageController,
                children: _contentList
                    .map((item) => orientation == Orientation.portrait
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Lottie.asset(item.path),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(item.content,
                                    style: const TextStyle(fontSize: 16)),
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Lottie.asset(item.path),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Expanded(
                                  child: Text(
                                item.content,
                                style: const TextStyle(fontSize: 20),
                              ))
                            ],
                          ))
                    .toList(),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !_isLast,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                  elevation: 11,
                  child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'Skip',
                        style: TextStyle(fontSize: 15),
                      )),
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  color: Colors.blue.shade900,
                  onPressed: () {
                    _pageController.animateToPage(_contentList.length,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.decelerate);
                  }),
              MaterialButton(
                  elevation: 11,
                  child: const Padding(
                    padding: EdgeInsets.all(15),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  textColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  color: Colors.blue.shade900,
                  onPressed: () {
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.decelerate);
                  }),
            ],
          ),
        ),
        Visibility(
            visible: _isLast,
            child: MaterialButton(
                elevation: 11,
                minWidth: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                textColor: Colors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                color: Colors.blue.shade900,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: ((context) => const Home())));
                }))
      ],
    );
  }
}
