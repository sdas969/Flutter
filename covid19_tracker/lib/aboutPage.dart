import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/octicons_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

_launchURLapk() async {
  const url =
      'https://github.com/sdas969/Flutter/blob/master/covid19_tracker/app-armeabi-v7a-release.apk';
  if (await canLaunch(url)) {
    await launch(
      url,
    );
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLrepo() async {
  const url = 'https://github.com/sdas969/Flutter/tree/master/covid19_tracker';
  if (await canLaunch(url)) {
    await launch(
      url,
    );
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLgit() async {
  const url = 'https://github.com/sdas969';
  if (await canLaunch(url)) {
    await launch(
      url,
    );
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLapi() async {
  const url = 'https://disease.sh/';
  if (await canLaunch(url)) {
    await launch(
      url,
    );
  } else {
    throw 'Could not launch $url';
  }
}

class _AboutPageState extends State<AboutPage> {
  ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 100,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(20))),
            expandedHeight: 200,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Icon(
                Entypo.info,
                size: 160,
                color: Colors.blue[900].withOpacity(0.6),
              ),
              centerTitle: true,
              title: Text(
                'About',
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.w900)),
              ),
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
            ),
            stretch: true,
          ),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset('assets/Corona.png'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Text('Corona Tracker',
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          'Made By',
                          style: GoogleFonts.lato(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          'Smarajit Das',
                          style: GoogleFonts.lato(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ResponsiveGridRow(children: [
                          ResponsiveGridCol(
                            lg: 3,
                            xl: 3,
                            xs: 6,
                            sm: 6,
                            md: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.blue[900],
<<<<<<< HEAD
                                    padding: const EdgeInsets.all(20)),
                                icon: const Icon(
=======
                                    padding: EdgeInsets.all(20)),
                                icon: Icon(
>>>>>>> 4f3af15 (Update)
                                  Icons.android,
                                  color: Colors.greenAccent,
                                ),
                                onPressed: _launchURLapk,
                                label: Text(
                                  'Download',
                                  style: GoogleFonts.lato(
                                      textStyle:
<<<<<<< HEAD
                                          const TextStyle(color: Colors.white)),
=======
                                          TextStyle(color: Colors.white)),
>>>>>>> 4f3af15 (Update)
                                ),
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            lg: 3,
                            xl: 3,
                            xs: 6,
                            sm: 6,
                            md: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
<<<<<<< HEAD
                                    padding: const EdgeInsets.all(20)),
                                icon: const Icon(Octicons.repo),
=======
                                    padding: EdgeInsets.all(20)),
                                icon: Icon(Octicons.repo),
>>>>>>> 4f3af15 (Update)
                                onPressed: _launchURLrepo,
                                label: Text(
                                  'Repository',
                                  style: GoogleFonts.lato(
                                      textStyle:
<<<<<<< HEAD
                                          const TextStyle(color: Colors.white)),
=======
                                          TextStyle(color: Colors.white)),
>>>>>>> 4f3af15 (Update)
                                ),
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            lg: 3,
                            xl: 3,
                            xs: 6,
                            sm: 6,
                            md: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
<<<<<<< HEAD
                                    padding: const EdgeInsets.all(20)),
                                icon: const Icon(
=======
                                    padding: EdgeInsets.all(20)),
                                icon: Icon(
>>>>>>> 4f3af15 (Update)
                                  FontAwesome5.github,
                                  color: Colors.white,
                                ),
                                onPressed: _launchURLgit,
                                label: Text(
                                  '@sdas969',
                                  style: GoogleFonts.lato(
                                      textStyle:
<<<<<<< HEAD
                                          const TextStyle(color: Colors.white)),
=======
                                          TextStyle(color: Colors.white)),
>>>>>>> 4f3af15 (Update)
                                ),
                              ),
                            ),
                          ),
                          ResponsiveGridCol(
                            lg: 3,
                            xl: 3,
                            xs: 6,
                            sm: 6,
                            md: 6,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
<<<<<<< HEAD
                                    padding: const EdgeInsets.all(20),
                                    primary: Colors.blue),
                                icon: const Icon(FontAwesome.database),
=======
                                    padding: EdgeInsets.all(20),
                                    primary: Colors.blue),
                                icon: Icon(FontAwesome.database),
>>>>>>> 4f3af15 (Update)
                                onPressed: _launchURLapi,
                                label: Text(
                                  'disease.sh',
                                  style: GoogleFonts.lato(
                                      textStyle:
<<<<<<< HEAD
                                          const TextStyle(color: Colors.white)),
=======
                                          TextStyle(color: Colors.white)),
>>>>>>> 4f3af15 (Update)
                                ),
                              ),
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
