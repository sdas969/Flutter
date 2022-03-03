import 'package:elearning_app/Screens/HomeScreen/ForYouSection.dart';
import 'package:elearning_app/Screens/HomeScreen/LiftYourCareerCard.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:elearning_app/utils/const.dart';
import 'package:elearning_app/widgets/card_courses.dart';
import 'package:elearning_app/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreenBody extends StatefulWidget {
  AdvancedDrawerController controller;
  HomeScreenBody({required this.controller});
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final TextEditingController _searchControl = new TextEditingController();
  late FocusNode myFocusNode;
  RoundedRectangleBorder sliverAppBarShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)));

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _searchControl.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            IconButton menuButton = IconButton(
                onPressed: () {
                  widget.controller.toggleDrawer();
                },
                icon: Icon(Icons.menu));
            return <Widget>[
              SliverAppBar(
                elevation: 20,
                forceElevated: true,
                backgroundColor: Constants.salmonMain,
                shape: sliverAppBarShape,
                leading: menuButton,
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle
                  ],
                  background: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Image.asset("assets/images/blob_2.png",
                            width: 352,
                            height: 343,
                            color: Constants.salmonDark),
                        top: -100,
                        right: -130,
                      ),
                      Positioned(
                        child: Image.asset("assets/images/blob_1.png",
                            width: 302,
                            height: 343,
                            color: Constants.salmonLight),
                        top: 20,
                        left: -100,
                      ),
                      Positioned(
                        child: Image.asset(
                          "assets/images/boy_illustration.png",
                          width: 160,
                          height: 360,
                        ),
                        bottom: 0,
                        right: 0,
                      ),
                      Positioned.directional(
                          textDirection: TextDirection.ltr,
                          start: 50,
                          bottom: 100,
                          child: Text(
                            "Welcome\nSmarajit!",
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                                color: Colors.white),
                          )),
                      Positioned.directional(
                        bottom: 20,
                        start: 10,
                        end: 10,
                        textDirection: TextDirection.ltr,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: TextField(
                            onTap: () {},
                            focusNode: myFocusNode,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Constants.textDark,
                            ),
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              hintText: "Search exams",
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.search,
                                  color: Constants.textDark,
                                ),
                                onPressed: () {
                                  debugPrint("Search pressed");
                                },
                              ),
                              hintStyle: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            maxLines: 1,
                            controller: _searchControl,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            padding: EdgeInsets.all(11),
            children: [
              LiftYourCareer(), //Lift You Career Card
              SizedBox(height: 20.0), //Gap
              Text("For You", //For you section start
                  style: TextStyle(
                    color: Constants.textDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(height: 20.0), //Gap
              ForYouSection(), //For you section cards display
              SizedBox(height: 20.0), //Gap
              //For you section ends
              //Cards diplay starts
              CardCourses(
                onPressed: () {},
                image: Image.asset("assets/exam.png", width: 40, height: 40),
                color: Constants.lightPink,
                title: "Exams",
                hours: "Revise, Organise, Practice",
              ),
              CardCourses(
                onPressed: () {},
                image: Image.asset("assets/currentaffairs.png",
                    width: 40, height: 40),
                color: Constants.lightYellow,
                title: "Current Affairs",
                hours: "All in one place, here",
              ),
              CardCourses(
                image: Image.asset("assets/knowledgezone.png",
                    width: 40, height: 40),
                color: Colors.teal[100]!,
                onPressed: () {},
                title: "Knowledge Zone",
                hours: "What you know is just a drop in an ocean",
              ),
              CardCourses(
                onPressed: () {},
                image: Image.asset("assets/quiz.png", width: 40, height: 40),
                color: Colors.lightBlue[100]!,
                title: "Quiz",
                hours: "Practice!, Practice! and Practice!",
              ),
              CardCourses(
                onPressed: () {},
                image: Image.asset("assets/fulllengthtest.png",
                    width: 40, height: 40),
                color: Colors.red[100]!,
                title: "Full Length Test",
                hours: "Consistency is the Key",
              ),
              CardCourses(
                onPressed: () {},
                image:
                    Image.asset("assets/institute.png", width: 40, height: 40),
                color: Constants.lightViolet,
                title: "Institute Batch Management",
                hours: "Manage your Institute Batches",
              ),
              CardCourses(
                onPressed: () {
                  print('Hello');
                },
                image: Image.asset("assets/notification.png",
                    width: 40, height: 40),
                color: Colors.cyan[100]!,
                title: "Institute Notification",
                hours: "Latest upadates across Institutes",
              ),
            ],
          ),
        )
        // MainBody(myFocusNode: myFocusNode, searchControl: _searchControl),
        );
  }
}
