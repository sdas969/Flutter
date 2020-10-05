import 'package:flutter/cupertino.dart';
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
  TextEditingController _textController = TextEditingController();
  List<ListTile> states = [];
  List<ListTile> newCountry = [];
  List<ListTile> newStates = [];
  List<String> tabs = ['Countries', 'States'];
  bool show = true;
  Future<void> places() async {
    List<ListTile> countries1 = [];
    List<ListTile> states1 = [];
    newCountry = List.from(countries);
    newStates = [];
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
      newCountry = List.from(countries1);
      newStates = List.from(states1);
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
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    bottom:
                        TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
                      Tab(
                          child: Text(
                        'Countries',
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      )),
                      Tab(
                          child: Text('States',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))))
                    ]),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20))),
                    stretch: true,
                    expandedHeight: 300,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Hero(
                          tag: 'search',
                          child: Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Icon(Icons.search,
                                    size: 100, color: Colors.white),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(74, 11, 74, 11),
                                  child: CupertinoTextField(
                                    onChanged: (value) {
                                      setState(() {
                                        newCountry = countries
                                            .where((element) => element.title
                                                .toString()
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
                                        newStates = states
                                            .where((element) => element.title
                                                .toString()
                                                .toLowerCase()
                                                .contains(value.toLowerCase()))
                                            .toList();
                                      });
                                    },
                                    style: GoogleFonts.lato(
                                        textStyle:
                                            TextStyle(color: Colors.white)),
                                    prefix: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 11),
                                        child: Icon(
                                          Icons.search,
                                          color: Color(0xffC4C6CC),
                                        ),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[900],
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    controller: _textController,
                                  ),
                                ),
                              ),
                              Expanded(child: Container())
                            ],
                          )),
                      stretchModes: [
                        StretchMode.zoomBackground,
                        StretchMode.blurBackground,
                      ],
                      centerTitle: true,
                    ),
                  ),
                ];
              },
              body: TabBarView(
                  children: tabs.map((String name) {
                return CustomScrollView(
                  key: PageStorageKey<String>(name),
                  physics: BouncingScrollPhysics(),
                  slivers: [
                    SliverList(
                        delegate: SliverChildListDelegate(
                            name == 'Countries' ? newCountry : newStates))
                  ],
                );
              }).toList()),
            ),
          ),
        ),
      ),
    );
  }
}

// DefaultTabController.of(context).index
