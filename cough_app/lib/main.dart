import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cough_app/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:http/http.dart';
import 'package:google_fonts/google_fonts.dart';

typedef _Fn = void Function();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    theme: ThemeData.dark().copyWith(
        textTheme:
            TextTheme().apply(fontFamily: GoogleFonts.lato().fontFamily)),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;
  String _mPath;
  String result = '';
  String downloadURLtext = '';
  FirebaseStorage storage = FirebaseStorage.instance;
  List<Widget> results = [];
  bool progressVisibility = false;
  String welcome = 'Press the Record button to start with';
  bool welcomeVisibility = true;

  @override
  void initState() {
    _mPlayer.openAudioSession().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    stopPlayer();
    _mPlayer.closeAudioSession();
    _mPlayer = null;

    stopRecorder();
    _mRecorder.closeAudioSession();
    _mRecorder = null;
    if (_mPath != null) {
      var outputFile = File(_mPath);
      if (outputFile.existsSync()) {
        outputFile.delete();
      }
    }
    super.dispose();
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await FirebaseStorage.instance.ref('uploads/temp.aac').putFile(file);
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }

  Future<void> openTheRecorder() async {
    var status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission not granted');
    }

    var tempDir = await getTemporaryDirectory();
    _mPath = '${tempDir.path}/flutter_sound_example.aac';
    var outputFile = File(_mPath);
    if (outputFile.existsSync()) {
      await outputFile.delete();
    }
    await _mRecorder.openAudioSession();
    _mRecorderIsInited = true;
  }

  Future<void> downloadURL() async {
    downloadURLtext =
        await FirebaseStorage.instance.ref('uploads/temp.aac').getDownloadURL();

    Map data = {
      'url': downloadURLtext,
    };
    String body = jsonEncode(data);
    Response response = await post(
      'https://coughapi.p.rapidapi.com/v1/recognize/url',
      headers: {
        "Content-Type": "application/json",
        'x-rapidapi-key': 'c19c974c3fmsh6c48bd57dcb75b8p150cdejsne66e25a063fc',
        'x-rapidapi-host': 'coughapi.p.rapidapi.com',
        'useQueryString': 'true'
      },
      body: body,
    );
    var temp = jsonDecode(response.body);
    List arr = temp['result']['episodes'];
    result = response.body;
    if (arr.length == 0) {
      results.clear();
      results.add(Text(
        'Error!!',
        style: TextStyle(fontSize: 47),
      ));
      results.add(ListTile(
        title: Center(child: Text('Unable to Predict...Please Try Again')),
      ));
    } else {
      results.clear();
      results.add(Text(
        'Results',
        style: TextStyle(fontSize: 47),
      ));
      results.add(ListTile(
        leading: Text(
          'Type',
          textAlign: TextAlign.center,
        ),
        title: Text('Length'),
        trailing: Text('Wet %'),
      ));
    }

    for (var i = 0; i < arr.length; i++) {
      results.add(ListTile(
        leading: Text(
          arr[i]['coughType'].toString().toUpperCase(),
          textAlign: TextAlign.center,
        ),
        title: Text(arr[i]['length'].toString()),
        subtitle: Text(
            'Start: ${arr[i]['start'].toString()}  End: ${arr[i]['end'].toString()}'),
        trailing:
            Text((arr[i]['wetPrediction'] * 100).toString().substring(0, 5)),
      ));
    }
    setState(() {});
  }

  Future<void> record() async {
    assert(_mRecorderIsInited && _mPlayer.isStopped);
    await _mRecorder.startRecorder(
      toFile: _mPath,
      codec: Codec.aacADTS,
    );
    results.clear();
    welcomeVisibility = false;
    setState(() {});
  }

  Future<void> stopRecorder() async {
    setState(() {
      progressVisibility = true;
      results.clear();
      welcomeVisibility = false;
    });
    await _mRecorder.stopRecorder();
    _mplaybackReady = true;

    await uploadFile(_mPath).then((value) async {
      await downloadURL();
      setState(() {
        progressVisibility = false;
      });
    });
  }

  void play() async {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder.isStopped &&
        _mPlayer.isStopped);
    await _mPlayer.startPlayer(
        fromURI: _mPath,
        codec: Codec.aacADTS,
        whenFinished: () {
          setState(() {});
        });
    setState(() {});
  }

  Future<void> stopPlayer() async {
    await _mPlayer.stopPlayer();
  }

  _Fn getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer.isStopped) {
      return null;
    }
    return _mRecorder.isStopped
        ? record
        : () {
            stopRecorder().then((value) => setState(() {}));
          };
  }

  _Fn getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder.isStopped) {
      return null;
    }
    return _mPlayer.isStopped
        ? play
        : () {
            stopPlayer().then((value) => setState(() {}));
          };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Info();
          }));
        },
        child: Icon(
          Icons.info_rounded,
          color: Colors.white,
          size: 29,
        ),
      ),
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
                          child: _mRecorder.isRecording
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  child: Icon(
                                    Icons.stop,
                                    size: 50,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  child: Icon(
                                    Icons.mic,
                                    size: 50,
                                  ),
                                ),
                          onPressed: getRecorderFn(),
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
                          child: _mPlayer.isPlaying
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  child: Icon(
                                    Icons.stop,
                                    size: 50,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  child: Icon(
                                    Icons.play_arrow,
                                    size: 50,
                                  ),
                                ),
                          onPressed: getPlaybackFn(),
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
            Column(
              children: [
                Visibility(
                  visible: progressVisibility,
                  child: LinearProgressIndicator(
                    semanticsLabel: 'Processing',
                    semanticsValue: 'Processing',
                  ),
                ),
              ],
            ),
            Column(
              children: results,
            ),
            Visibility(
              visible: welcomeVisibility,
              child: Padding(
                padding: const EdgeInsets.only(top: 47),
                child: Text(
                  welcome,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
