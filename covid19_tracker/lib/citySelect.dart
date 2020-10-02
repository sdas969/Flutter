import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';

class CitySelect extends StatefulWidget {
  @override
  _CitySelectState createState() => _CitySelectState();
}

class _CitySelectState extends State<CitySelect> {
  List<ListTile> placesall = [];
  bool show = true;
  Future<void> places() async {
    List<ListTile> placesall1 = [
      ListTile(
        title: Text(
          'Countries',
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
      ),
      ListTile(
        title: Divider(),
      ),
      ListTile(
        title: Text(
          'States',
          style: GoogleFonts.lato(
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
      )
    ];
    var temp = await http.get('https://disease.sh/v3/covid-19/jhucsse');
    var jsonResall = convert.jsonDecode(temp.body);
    int index = 1;
    for (int i = 0; i < jsonResall.length; i++) {
      if (jsonResall[i]['province'] == null) {
        placesall1.insert(
            index,
            ListTile(
              title: Text(jsonResall[i]['country']),
              onTap: () {
                Navigator.pop(context, [jsonResall[i]['country'], null]);
              },
            ));
        index++;
      } else {
        placesall1.add(ListTile(
          title: Text(jsonResall[i]['province']),
          trailing: Text(jsonResall[i]['country'].toString().toUpperCase()),
          onTap: () {
            Navigator.pop(
                context, [jsonResall[i]['country'], jsonResall[i]['province']]);
          },
        ));
      }
    }
    setState(() {
      show = false;
      placesall = placesall1;
    });
  }

  @override
  void initState() {
    super.initState();
    places();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.latoTextTheme(
        Theme.of(context).textTheme,
      ).apply(bodyColor: Colors.white, displayColor: Colors.white)),
      home: Scaffold(
        body: ModalProgressHUD(
          opacity: 0,
          inAsyncCall: show,
          child: CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(20))),
                stretch: true,
                expandedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [StretchMode.fadeTitle],
                  title: Hero(
                      tag: 'search',
                      child: Icon(
                        Icons.search,
                        size: 40,
                        color: Colors.white,
                        semanticLabel: 'Search',
                      )),
                  centerTitle: true,
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                placesall,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
