import 'package:flutter/material.dart';
import 'pages.dart';
import 'dark.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> pages = ['home', 'account'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            bottomNavigationBar: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.account_box,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            body: TabBarView(
              children: pages.map((String page) {
                if (page == pages[0]) {
                  return Scaffold(
                    body: Paged(),
                  );
                } else if (page == pages[1]) {
                  return Scaffold(
                    body: AboutPage(),
                  );
                }
              }).toList(),
            ),
          ),
        ));
  }
}
