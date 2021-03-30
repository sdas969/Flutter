import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Final extends StatefulWidget {
  @override
  _FinalState createState() => _FinalState();
}

class _FinalState extends State<Final> {
  final databaseReference = FirebaseFirestore.instance;
  String image = null;
  String Caption = null;
  String location = null;
  bool show = true;
  void getdata() async {
    await databaseReference.collection('data').get().then((item) {
      var res = item.docs.first.data();
      image = res['imageurl'];
      Caption = res['Caption'];
      location = res['Location'];
    }).then((value) {
      setState(() {
        show = false;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload App'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: show,
        progressIndicator: CircularProgressIndicator(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: image == null
                ? []
                : [
                    ClipRRect(
                      child: Image.network(image),
                    ),
                    ListTile(
                      leading: Text('Caption'),
                      title: Text(Caption),
                    ),
                    ListTile(
                      leading: Text('Location'),
                      title: Text(location),
                    ),
                  ],
          ),
        ),
      ),
    );
  }
}
