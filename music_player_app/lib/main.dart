import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double val1 = 10;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: TabBar(
            indicatorColor: Colors.orange,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 5,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.mic_outlined,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.account_box_outlined,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Container(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                                height: 500,
                                decoration: new BoxDecoration(
                                  color: Color(0xfff9c62e),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(11, 60, 11, 0),
                                  child: ListTile(
                                    title: Text(
                                      'Hi Smarajit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                          color: Colors.white),
                                    ),
                                    subtitle: Text(
                                      'Listen to our podcasts and spiritual videos',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    trailing: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https://avatars2.githubusercontent.com/u/60264722?s=460&u=4a05c7a35dbc74834c29647e84b39df018facdde&v=4'),
                                    ),
                                  ),
                                )),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40))),
                              height: 200,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 0, 30, 60),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)),
                                  elevation: 30,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 16, 0, 0),
                                        child: Text(
                                          'Now Playing',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            16, 0, 16, 16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                                                radius: 60,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8),
                                                child: Card(
                                                  elevation: 20,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30)),
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 10),
                                                        child: ListTile(
                                                          title:
                                                              Text('Portals'),
                                                          subtitle: Text(
                                                              'Avengers: Endgame'),
                                                        ),
                                                      ),
                                                      Slider(
                                                        min: 0,
                                                        max: 100,
                                                        value: val1,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            val1 = value;
                                                          });
                                                        },
                                                      ),
                                                      Card(
                                                        elevation: 10,
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30)),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            IconButton(
                                                              icon: Icon(Icons
                                                                  .skip_previous_rounded),
                                                              onPressed: () {},
                                                            ),
                                                            IconButton(
                                                              icon: Icon(Icons
                                                                  .play_arrow_rounded),
                                                              onPressed: () {},
                                                            ),
                                                            IconButton(
                                                              icon: Icon(Icons
                                                                  .skip_next_rounded),
                                                              onPressed: () {},
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                          child: Text(
                            'New Uploaded',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.grey.shade700),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                            ),
                            title: Text('Totally Fine'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('4:30'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                            ),
                            title: Text('Arrival'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('1:50'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                            ),
                            title: Text('No Trust'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('3:09'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                            ),
                            title: Text('Where Are They?'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('3:13'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                            ),
                            title: Text('Becoming Whole Again'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('3:48'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                            ),
                            title: Text('I Figured It Out'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('4:30'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                            ),
                            title: Text('Perfectly Not Confusing'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('4:30'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                            ),
                            title: Text('You Shouldn' 't Be Here'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('4:30'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 10,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://lh3.googleusercontent.com/proxy/ZS2gSVa24_0fmNXextfNTCczq51MbVEOIOzslvzDW8SXMtE_RtojqRVMeaenemlAtAxEVqgyL2F9m6NLP7g_YyW4RE2ffJboRsb0Vyye7NqOGskiJszj26QuWeXEL_J6MjusYSRoro9LFkldUPaXAmG_50uK22yn03jcHDk57Uc'),
                            ),
                            title: Text('Portals'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('4:30'),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
