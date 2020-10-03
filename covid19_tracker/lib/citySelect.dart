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
  List<ListTile> countries = [];
  List<ListTile> states = [];
  bool show = true;
  Future<void> places() async {
    List<ListTile> countries1 = [];
    List<ListTile> states1 = [];
    var temp = await http.get('https://disease.sh/v3/covid-19/jhucsse');
    var jsonResall = convert.jsonDecode(temp.body);
    for (int i = 0; i < jsonResall.length; i++) {
      if (jsonResall[i]['province'] == null) {
        countries1.add(ListTile(
          title: Text(
            jsonResall[i]['country'],
            style: GoogleFonts.lato(),
          ),
          onTap: () {
            Navigator.pop(context, [jsonResall[i]['country'], null]);
          },
        ));
      } else {
        states1.add(ListTile(
          title: Text(
            jsonResall[i]['province'],
            style: GoogleFonts.lato(),
          ),
          trailing: Text(jsonResall[i]['country'].toString().toUpperCase(),
              style: GoogleFonts.lato()),
          onTap: () {
            Navigator.pop(
                context, [jsonResall[i]['country'], jsonResall[i]['province']]);
          },
        ));
      }
    }
    setState(() {
      show = false;
      countries = countries1;
      states = states1;
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
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: ModalProgressHUD(
            opacity: 0,
            inAsyncCall: show,
            child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  bottom:
                      TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
                    Tab(
                      child: Text('Countries',
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(fontSize: 20))),
                    ),
                    Tab(
                        child: Text('States',
                            style: GoogleFonts.lato(
                                textStyle: TextStyle(fontSize: 20))))
                  ]),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                  stretch: true,
                  expandedHeight: 200,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                      tag: 'search',
                      child: Icon(Icons.search, size: 100, color: Colors.white),
                    ),
                    stretchModes: [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground,
                    ],
                    centerTitle: true,
                  ),
                ),
                SliverFillRemaining(
                  child: TabBarView(children: [
                    ListView(
                      physics: BouncingScrollPhysics(),
                      children: countries,
                    ),
                    ListView(
                      physics: BouncingScrollPhysics(),
                      children: states,
                    )
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
