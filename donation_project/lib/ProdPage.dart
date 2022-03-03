import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Noti.dart';

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
  void getTile() async {
    List<Widget> items1 = [];
    items1.add(Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.userType == 'patient' ? 'Donors' : 'Patients',
          style: TextStyle(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    ));

    await databaseReference
        .collection(widget.userType == 'patient' ? 'donor' : 'patient')
        .get()
        .then((item) {
      item.docs.forEach((element) {
        items1.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.redAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            NetworkImage(element.data()['imageurl']),
                      )),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              element.data()['Full name'],
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              element.data()['Diseases'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              element.data()['Address'],
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MaterialButton(
                              elevation: 20,
                              color: Colors.blueAccent.shade700,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onPressed: () {
                                setState(() {});
                              },
                              child: Text(
                                'Show Interest',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
      });
    });
    setState(() {
      items = items1;
    });
  }

  @override
  void initState() {
    getTile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red.shade800,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          elevation: 11,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
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
            IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Noti()));
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(widget.userType.toUpperCase())),
            )
          ],
        ),
        body: ListView(
          children: items.length == 0 ? [LinearProgressIndicator()] : items,
        ));
  }
}
