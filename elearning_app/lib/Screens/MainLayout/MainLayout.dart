import 'package:elearning_app/Screens/HomeScreen/home_screen_body.dart';
import 'package:elearning_app/Screens/MainLayout/DrawerElements.dart';
import 'package:elearning_app/Screens/MainLayout/MainLayoutConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  @override
  void dispose() {
    advancedDrawerController.dispose();
    super.dispose();
  }

  final List<Widget> widgetOptions = <Widget>[
    HomeScreenBody(),
    Center(
      child: Text('Discuss'),
    ),
    Center(
      child: Text('Study Zone'),
    ),
    Center(
      child: Text('Profile'),
    )
  ];

  @override
  Widget build(BuildContext context) {
    PreferredSize _appBar = PreferredSize(
      preferredSize: Size(double.infinity, 100),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(11),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    advancedDrawerController.toggleDrawer();
                  },
                  icon: Icon(Icons.menu, color: Colors.white)),
            ],
          ),
        ),
      ),
    );

    Container _bottomNavBar = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black.withOpacity(.2),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 11),
          child: GNav(
            rippleColor: Colors.blue[300]!,
            hoverColor: Colors.blue[100]!,
            gap: 8,
            activeColor: Colors.blue,
            iconSize: 24,
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: bottomTabs,
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );

    return AdvancedDrawer(
      backdropColor: Colors.deepPurple,
      controller: advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      drawer: DrawerElements(drawerElements: drawerElements),
      childDecoration: boxDecoration,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar,
        backgroundColor: Colors.white,
        body: Center(
          child: widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: _bottomNavBar,
      ),
    );
  }
}
