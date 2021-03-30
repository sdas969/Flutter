import 'package:donation_project/ProdPage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class FormPage extends StatefulWidget {
  final String userType;
  final String enterType;

  FormPage(this.userType, this.enterType);
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final databaseReference = FirebaseFirestore.instance;
  bool show = false;
  String downloadURL;
  File _image;
  void createRecord(String fname, String addr, String disease, String email,
      String ph, String userType, String downloadurl) async {
    await databaseReference.collection(userType).doc(fname).set({
      'Full name': fname,
      'Address': addr,
      'Phone No.': ph,
      'Diseases': disease,
      'email': email,
      'imageurl': downloadurl
    });
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {
      setState(() {
        _image = image;
        print(_image.path);
      });
    });
  }

  Future<void> uploadFile(
      String filePath, String fname, String email, String phno) async {
    File file = File(filePath);

    try {
      await FirebaseStorage.instance
          .ref('uploads/$fname$email$phno.jpg')
          .putFile(file);
      String downloadURLtext = await FirebaseStorage.instance
          .ref(
              'uploads/${fnameInputController.text}${emailInputController.text}${phInputController.text}.jpg')
          .getDownloadURL();
      downloadURL = downloadURLtext;
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
    }
  }

  TextEditingController fnameInputController = new TextEditingController();
  TextEditingController addrInputController = new TextEditingController();
  TextEditingController deasInputController = new TextEditingController();
  TextEditingController emailInputController = new TextEditingController();
  TextEditingController pwdInputController = new TextEditingController();
  TextEditingController phInputController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade800,
      body: SafeArea(
          child: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(),
        inAsyncCall: show,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(
                    child: Text(
                  'Blood Share',
                  style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                )),
              ),
              Visibility(
                  visible: widget.enterType == 'Register',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 5),
                    child: MaterialButton(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 8),
                          child: ListTile(
                            leading: Icon(Icons.upload_file),
                            title: Text('Upload File'),
                          )),
                      onPressed: () {
                        chooseFile();
                      },
                    ),
                  )),
              Visibility(
                visible: widget.enterType == 'Register',
                child: Material(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25))),
                  color: Colors.redAccent,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: fnameInputController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(25))),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.enterType == 'Register',
                child: Material(
                  elevation: 10,
                  color: Colors.redAccent,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: addrInputController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Address',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(0))),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.enterType == 'Register',
                child: Material(
                  elevation: 10,
                  color: Colors.redAccent,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: phInputController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Phone No.',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(0))),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: widget.enterType == 'Register',
                child: Material(
                  color: Colors.redAccent,
                  elevation: 10,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    controller: deasInputController,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: 'Name of diseases(s)',
                      hintStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(0))),
                    ),
                  ),
                ),
              ),
              Material(
                elevation: 10,
                color: Colors.redAccent,
                shape: widget.enterType == 'Register'
                    ? null
                    : RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(25))),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: emailInputController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                              widget.enterType == 'Register' ? 0 : 25)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                                widget.enterType == 'Register' ? 0 : 25))),
                  ),
                ),
              ),
              Material(
                color: Colors.redAccent,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25))),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  controller: pwdInputController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(25)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                            style: BorderStyle.solid),
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(25))),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 11),
                child: MaterialButton(
                  elevation: 25,
                  color: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                  onPressed: () async {
                    setState(() {
                      show = true;
                    });

                    await Firebase.initializeApp();
                    if (widget.enterType == 'Register') {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text)
                            .then((value) async {
                          await uploadFile(
                              _image.path,
                              fnameInputController.text,
                              emailInputController.text,
                              phInputController.text);
                          createRecord(
                            fnameInputController.text,
                            addrInputController.text,
                            deasInputController.text,
                            emailInputController.text,
                            phInputController.text,
                            widget.userType,
                            downloadURL,
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProdPage(
                                      fnameInputController.text,
                                      widget.userType)));
                        });
                      } on Exception catch (e) {
                        DangerAlertBox(
                            context: context,
                            title: 'Error!!',
                            messageText: 'Please fill the form correctly.');
                      }
                    } else {
                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text)
                            .then((value) {
                          databaseReference
                              .collection(widget.userType)
                              .get()
                              .then((querySnapshot) {
                            bool flag = false;
                            querySnapshot.docs.forEach((result) {
                              if (result.data()['email'] ==
                                  emailInputController.text) {
                                flag = true;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProdPage(
                                            result.data()['Full name'],
                                            widget.userType)));
                              }
                            });
                            if (!flag) {
                              DangerAlertBox(
                                  context: context,
                                  title: 'User Not Found',
                                  messageText:
                                      'Incorrect Username or Password');
                            }
                          });
                        });
                      } on Exception catch (exception) {
                        DangerAlertBox(
                            context: context,
                            title: 'User Not Found',
                            messageText: 'Incorrect Username or Password');
                      }
                    }
                    setState(() {
                      show = false;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Text(widget.enterType,
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
