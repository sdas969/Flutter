import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double val1 = 10;
  bool playing = false;
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
                  FontAwesomeIcons.home,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.podcast,
                  color: Colors.black,
                ),
              ),
              Tab(
                icon: Icon(
                  FontAwesomeIcons.user,
                  color: Colors.black,
                ),
              )
            ],
          ),
          body: SingleChildScrollView(
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
                                height: 600,
                                decoration: new BoxDecoration(
                                  color: Color(0xffFE7A48),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(11, 180, 11, 0),
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
                            Padding(
                              padding: const EdgeInsets.only(bottom: 270),
                              child: Image(
                                image: NetworkImage(
                                    'https://cdn-sharing.adobecc.com/id/urn:aaid:sc:US:3d98e63c-67e2-40ab-a820-37df3357f876;version=0?component_id=641380f7-e5a8-49f8-8085-1d74ce9da69e&api_key=CometServer1&access_token=1604721844_urn%3Aaaid%3Asc%3AUS%3A3d98e63c-67e2-40ab-a820-37df3357f876%3Bpublic_2e59db0e3239734f951781927606027f6f44b563'),
                                height: 320,
                                width: 700,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30))),
                              height: 200,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 60),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32)),
                                  elevation: 5,
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
                                              MainAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                  child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(11),
                                                child: Image.network(
                                                    'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg'),
                                              )),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Card(
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 16),
                                                      child: ListTile(
                                                        title: Text('Portals'),
                                                        subtitle: Text(
                                                            'Avengers: Endgame'),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        3),
                                                            child: Text(
                                                              '0:00',
                                                            ),
                                                          ),
                                                          SliderTheme(
                                                            data: SliderThemeData(
                                                                trackShape:
                                                                    CustomTrackShape(),
                                                                trackHeight: 10,
                                                                activeTrackColor:
                                                                    Color(
                                                                        0xffFE7A48),
                                                                thumbColor: Color(
                                                                    0xffFE7A48),
                                                                thumbShape:
                                                                    RoundSliderThumbShape(
                                                                        enabledThumbRadius:
                                                                            5)),
                                                            child: Expanded(
                                                              child: Container(
                                                                height: 10,
                                                                child: Slider(
                                                                  min: 0,
                                                                  max: 100,
                                                                  value: val1,
                                                                  onChanged:
                                                                      (value) {
                                                                    setState(
                                                                        () {
                                                                      val1 =
                                                                          value;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        3),
                                                            child: Text(
                                                              '4:36',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Card(
                                                      elevation: 0,
                                                      shape:
                                                          RoundedRectangleBorder(
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
                                                          Visibility(
                                                            visible: !playing,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .white,
                                                                      elevation:
                                                                          10,
                                                                      shape:
                                                                          CircleBorder()),
                                                              child: Icon(
                                                                Icons.pause,
                                                                color: Color(
                                                                    0xffFE7A48),
                                                              ),
                                                              onPressed: () {
                                                                MusicPlayer()
                                                                    .pause();
                                                                setState(() {
                                                                  playing =
                                                                      !playing;
                                                                });
                                                              },
                                                            ),
                                                          ),
                                                          Visibility(
                                                            visible: playing,
                                                            child:
                                                                ElevatedButton(
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      primary:
                                                                          Colors
                                                                              .white,
                                                                      elevation:
                                                                          10,
                                                                      shape:
                                                                          CircleBorder()),
                                                              child: Icon(
                                                                Icons
                                                                    .play_arrow_rounded,
                                                                color: Color(
                                                                    0xffFE7A48),
                                                              ),
                                                              onPressed: () {
                                                                MusicPlayer().play(MusicItem(
                                                                    url:
                                                                        'https://goo.gl/5RQjTQ',
                                                                    trackName:
                                                                        'Portals',
                                                                    artistName:
                                                                        'Alan Silvestri',
                                                                    albumName:
                                                                        'Avengers: Endgame',
                                                                    duration:
                                                                        null,
                                                                    coverUrl:
                                                                        'https://i.ytimg.com/vi/F_mhWxOjxp4/hq720.jpg?sqp=-oaymwEZCNAFEJQDSFXyq4qpAwsIARUAAIhCGAFwAQ==&rs=AOn4CLDUASnX2-DZbs3XoqwJQPDuRHSnXQ'));
                                                                setState(() {
                                                                  playing =
                                                                      !playing;
                                                                });
                                                              },
                                                            ),
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
                          elevation: 1,
                          child: ListTile(
                            leading: Container(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg',
                              ),
                            )),
                            title: Text('Totally Fine'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('4:30'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: ListTile(
                            leading: Container(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg',
                              ),
                            )),
                            title: Text('Arrival'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('1:50'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: ListTile(
                            leading: Container(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg',
                              ),
                            )),
                            title: Text('No Trust'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('3:09'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: ListTile(
                            leading: Container(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg',
                              ),
                            )),
                            title: Text('Where Are They?'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('3:13'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: ListTile(
                            leading: Container(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg',
                              ),
                            )),
                            title: Text('Becoming Whole Again'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('3:48'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: ListTile(
                            leading: Container(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg',
                              ),
                            )),
                            title: Text('I Figured It Out'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('4:30'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: ListTile(
                            leading: Container(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg',
                              ),
                            )),
                            title: Text('Perfectly Not Confusing'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('4:30'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: ListTile(
                            leading: Container(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg',
                              ),
                            )),
                            title: Text('You Shouldn' 't Be Here'),
                            subtitle: Text('Avengers: Endgame'),
                            trailing: Text('4:30'),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: ListTile(
                            leading: Container(
                                child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Image.network(
                                'https://images-na.ssl-images-amazon.com/images/I/51lvxZDKppL.jpg',
                              ),
                            )),
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

class CustomTrackShape extends RoundedRectSliderTrackShape {
  Rect getPreferredRect({
    @required RenderBox parentBox,
    Offset offset = Offset.zero,
    @required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
