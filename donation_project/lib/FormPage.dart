import 'package:donation_project/ProdPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormPage extends StatefulWidget {
  final String userType;
  final String enterType;

  FormPage(this.userType, this.enterType);
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final databaseReference = FirebaseFirestore.instance;

  void createRecord(String fname, String addr, String disease, String email,
      String ph, String userType) async {
    await databaseReference.collection(userType).doc(fname).set({
      'Full name': fname,
      'Address': addr,
      'Phone No.': ph,
      'Diseases': disease,
      'email': email
    });
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                  child: Text(
                'Blood Friends',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              )),
            ),
            Visibility(
              visible: widget.enterType == 'Register',
              child: TextField(
                controller: fnameInputController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25))),
                ),
              ),
            ),
            Visibility(
              visible: widget.enterType == 'Register',
              child: TextField(
                controller: addrInputController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Address',
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(0))),
                ),
              ),
            ),
            Visibility(
              visible: widget.enterType == 'Register',
              child: TextField(
                controller: phInputController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Phone No.',
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(0))),
                ),
              ),
            ),
            Visibility(
              visible: widget.enterType == 'Register',
              child: TextField(
                controller: deasInputController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: 'Name of diseases(s)',
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(0))),
                ),
              ),
            ),
            TextField(
              controller: emailInputController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Email',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          widget.enterType == 'Register' ? 0 : 25)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.vertical(
                        top: Radius.circular(
                            widget.enterType == 'Register' ? 0 : 25))),
              ),
            ),
            TextField(
              controller: pwdInputController,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(25)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(25))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 11),
              child: MaterialButton(
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () async {
                  await Firebase.initializeApp();
                  if (widget.enterType == 'Register') {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailInputController.text,
                            password: pwdInputController.text)
                        .then((value) {
                      createRecord(
                          fnameInputController.text,
                          addrInputController.text,
                          deasInputController.text,
                          emailInputController.text,
                          phInputController.text,
                          widget.userType);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProdPage(
                                  fnameInputController.text, widget.userType)));
                    });
                  } else {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailInputController.text,
                            password: pwdInputController.text)
                        .then((value) {
                      databaseReference
                          .collection(widget.userType)
                          .get()
                          .then((querySnapshot) {
                        querySnapshot.docs.forEach((result) {
                          if (result.data()['email'] ==
                              emailInputController.text) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProdPage(
                                        result.data()['Full name'],
                                        widget.userType)));
                          }
                        });
                      });
                    });
                  }
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
      )),
    );
  }
}
