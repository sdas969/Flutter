import 'package:elearning_app/Screens/HomeScreen/KnowMoreButton.dart';
import 'package:elearning_app/Screens/HomeScreen/SearchScreen.dart';
import 'package:elearning_app/Screens/HomeScreen/category_screen.dart';
import 'ForYouCard.dart';
import 'package:elearning_app/utils/const.dart';
import 'package:elearning_app/widgets/card_courses.dart';
import 'package:elearning_app/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreenBody extends StatefulWidget {
  @override
  _HomeScreenBodyState createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final TextEditingController _searchControl = new TextEditingController();
  late FocusNode myFocusNode;

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
      body: Stack(
        children: <Widget>[
          Header(),
          Padding(
            padding: EdgeInsets.all(Constants.mainPadding),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(height: Constants.mainPadding * 2),
                Text(
                  "Welcome\nSmarajit!",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
                SizedBox(height: Constants.mainPadding),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: Hero(
                    tag: 'TextField',
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

                SizedBox(height: Constants.mainPadding),

                // 3. Start Learning Button Section
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0xFFFEF3F3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Lift Your Career \nWith Us!",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Constants.textDark),
                          ),
                          SizedBox(height: 10.0),
                          KnowMoreButton()
                        ],
                      ),
                    ),

                    // Image Researching Girl
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/researching.png",
                        width: 200,
                        height: 104,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text("For You",
                    style: TextStyle(
                      color: Constants.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 20.0),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ForYouCard(
                        title: 'Physics',
                        image: Image.asset('assets/exam.png'),
                        color: Colors.lightBlue[100]!,
                      ),
                      ForYouCard(
                        title: 'Chemistry',
                        image: Image.asset('assets/currentaffairs.png'),
                        color: Colors.pink[100]!,
                      ),
                      ForYouCard(
                        title: 'Mathematics',
                        image: Image.asset('assets/knowledgezone.png'),
                        color: Colors.teal[100]!,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),

                Text("Explore More",
                    style: TextStyle(
                      color: Constants.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),

                SizedBox(height: 20.0),

                // List of courses
                ListView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    CardCourses(
                      onPressed: () {},
                      image:
                          Image.asset("assets/exam.png", width: 40, height: 40),
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
                      image:
                          Image.asset("assets/quiz.png", width: 40, height: 40),
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
                      image: Image.asset("assets/institute.png",
                          width: 40, height: 40),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
