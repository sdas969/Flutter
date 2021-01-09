import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProdPage extends StatefulWidget {
  final String userName;
  final String userType;
  ProdPage(this.userName, this.userType);
  @override
  _ProdPageState createState() => _ProdPageState();
}

class _ProdPageState extends State<ProdPage> {
  final databaseReference = FirebaseFirestore.instance;
  List<Widget> items = [];
  List<bool> itemShow = [];
  void getTile() {
    items.add(Text(
      widget.userType == 'patient' ? 'Donors list' : 'Patients List',
      style: TextStyle(fontSize: 20),
    ));
    databaseReference
        .collection(widget.userType == 'patient' ? 'donor' : 'patient')
        .get()
        .then((item) {
      item.docs.forEach((element) {
        items.add(Card(
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      element.data()['Full name'],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(element.data()['Diseases']),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(element.data()['Address']),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('Show Interest'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
        setState(() {});
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getTile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello',
                style: TextStyle(fontSize: 15),
              ),
              Text(widget.userName),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(widget.userType.toUpperCase())),
            )
          ],
        ),
        body: Column(
          children: items,
        ));
  }
}
