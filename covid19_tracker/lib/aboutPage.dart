import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 100,
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(20))),
              expandedHeight: 200,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Icon(
                  Entypo.info,
                  size: 160,
                  color: Colors.blueAccent.withOpacity(0.6),
                ),
                centerTitle: true,
                title: Text(
                  'About',
                  style: GoogleFonts.lato(
                      textStyle:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                ),
                stretchModes: [
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
                                  textStyle: TextStyle(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton.icon(
                              color: Colors.blue[900],
                              icon: Icon(
                                Icons.android,
                                color: Colors.greenAccent,
                              ),
                              onPressed: _launchURLapk,
                              label: Text(
                                'Download',
                                style: GoogleFonts.lato(),
                              ),
                            ),
                            RaisedButton.icon(
                              color: Colors.green,
                              icon: Icon(Octicons.repo),
                              onPressed: _launchURLrepo,
                              label: Text(
                                'Repository',
                                style: GoogleFonts.lato(),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RaisedButton.icon(
                              color: Colors.black,
                              icon: Icon(FontAwesome5.github),
                              onPressed: _launchURLgit,
                              label: Text(
                                '@sdas969',
                                style: GoogleFonts.lato(),
                              ),
                            ),
                            RaisedButton.icon(
                              color: Colors.blue,
                              icon: Icon(FontAwesome.database),
                              onPressed: _launchURLapi,
                              label: Text(
                                'disease.sh',
                                style: GoogleFonts.lato(),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
