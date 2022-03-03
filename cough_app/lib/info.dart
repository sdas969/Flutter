import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  Future<void> _launched;

  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [Text('Made By Smarajit Das')],
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Center(
                child: Text(
              'Cough Classifier',
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.w100),
            )),
            SizedBox(
              height: 60,
            ),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Hero(
                  tag: 'div',
                  child: Divider(
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Hero(
                        tag: 'rec',
                        child: MaterialButton(
                          elevation: 20,
                          disabledElevation: 10,
                          color: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            child: Icon(
                              Icons.code_rounded,
                              size: 50,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _launched = _launchInWebViewOrVC(
                                  'https://github.com/sdas969/Flutter/tree/master/cough_app');
                            });
                          },
                          disabledColor: Colors.blueAccent.shade100,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Hero(
                        tag: 'play',
                        child: MaterialButton(
                          color: Colors.pinkAccent,
                          elevation: 20,
                          disabledElevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            child: Icon(
                              Icons.api,
                              size: 50,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              _launched = _launchInWebViewOrVC(
                                  'https://rapidapi.com/CoughTracker/api/coughapi');
                            });
                          },
                          disabledColor: Colors.pinkAccent.shade100,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 56,
            ),
            Text(
              'This app breaks down cough events in the audio track recorded within the app and classifies it in to wet or dry cough. All this is possible due to the free-to-use Cough API. The API uses an AI model in order to classify the events',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
