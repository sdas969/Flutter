import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'corona_icons.dart';
import 'package:mbi/mbi.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

_launchURLgit() async {
  const url = 'https://github.com/sdas969';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchURLapi() async {
  const url = 'https://disease.sh/';
  if (await canLaunch(url)) {
    await launch(url);
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
              expandedHeight: 100,
              centerTitle: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('About'),
                stretchModes: [StretchMode.fadeTitle],
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
                        Icon(
                          Corona.virus,
                          color: Colors.pink,
                          size: 173,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text('Corona Tracker',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(fontSize: 40))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('Made By'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text('Smarajit Das'),
                        ),
                        RaisedButton.icon(
                          color: Colors.black,
                          icon: Icon(BrandsIcons.github1),
                          onPressed: _launchURLgit,
                          label: Text('@sdas969'),
                        ),
                        RaisedButton.icon(
                          color: Colors.blue,
                          icon: Icon(LineconsIcons.data),
                          onPressed: _launchURLapi,
                          label: Text('disease.sh'),
                        )
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
