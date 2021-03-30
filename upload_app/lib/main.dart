import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'final.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final databaseReference = FirebaseFirestore.instance;
  File _image;
  bool disp = false;
  String downloadURL;
  bool show = false;
  var temp;
  TextEditingController caption = TextEditingController();
  TextEditingController place = TextEditingController();
  final picker = ImagePicker();

  void createRecord(
      String caption1, String location, String downloadurl) async {
    await databaseReference.collection('data').doc('entry').set(
        {'Caption': caption1, 'Location': location, 'imageurl': downloadurl});
  }

  Future<void> uploadFile(String filePath) async {
    File file = File(filePath);

    try {
      await FirebaseStorage.instance.ref('uploads/temp.jpg').putFile(file);
      String downloadURLtext = await FirebaseStorage.instance
          .ref('uploads/temp.jpg')
          .getDownloadURL();
      downloadURL = downloadURLtext;
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }

  Future getImagecam() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    temp = pickedFile.path;
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {
          disp = true;
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImagegallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    temp = pickedFile.path;
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        setState(() {
          disp = true;
        });
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text('Upload Options'),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          MaterialButton(
            onPressed: getImagegallery,
            child: Text('Upload from Gallery'),
          ),
          MaterialButton(
            onPressed: getImagecam,
            child: Text('Upload from Camera'),
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload App'),
      ),
      body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(),
        inAsyncCall: show,
        child: ListView(
          children: [
            Visibility(
              visible: disp,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ClipRect(
                      child: _image != null
                          ? (kIsWeb ? Image.network(temp) : Image.file(_image))
                          : null,
                    ),
                    TextField(
                      controller: caption,
                      decoration: InputDecoration(hintText: 'Image Caption'),
                    ),
                    TextField(
                      controller: place,
                      decoration: InputDecoration(
                        hintText: 'Image Location',
                      ),
                    ),
                    MaterialButton(
                      onPressed: () async {
                        setState(() {
                          show = true;
                        });
                        await uploadFile(
                          _image.path,
                        );
                        createRecord(
                          caption.text,
                          place.text,
                          downloadURL,
                        );
                        setState(() {
                          show = false;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Final()));
                      },
                      child: Text('Submit'),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !disp,
              child: Center(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupDialog(context),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Upload',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  color: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
