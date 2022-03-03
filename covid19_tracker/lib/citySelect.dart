import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
<<<<<<< HEAD
=======
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
>>>>>>> 4f3af15 (Update)
import 'package:google_fonts/google_fonts.dart';

class CitySelect extends StatefulWidget {
  final bool switchVal;
  CitySelect(this.switchVal);
  @override
  _CitySelectState createState() => _CitySelectState();
}

class _CitySelectState extends State<CitySelect> {
  ScrollController _scrollController;
  List<ListTile> countries = [];
  TextEditingController _textController;
  List<ListTile> states = [];
  List<ListTile> newCountry = [];
  List<ListTile> newStates = [];
  List<String> tabs = ['Countries', 'States'];
  ThemeData themeDatadark = ThemeData.dark().copyWith(
      textTheme: GoogleFonts.latoTextTheme()
          .apply(bodyColor: Colors.white, displayColor: Colors.white));
  ThemeData themeDatalight = ThemeData.light().copyWith(
      textTheme: GoogleFonts.latoTextTheme()
          .apply(bodyColor: Colors.black, displayColor: Colors.black));
  bool show = true;
  Future<void> places() async {
    List<ListTile> countries1 = [];
    List<ListTile> states1 = [];
<<<<<<< HEAD
    await http
        .get(Uri.parse('https://disease.sh/v3/covid-19/jhucsse'))
        .then((value) {
      var jsonResall = convert.jsonDecode(value.body);
      for (int i = 0; i < jsonResall.length; i++) {
        if (jsonResall[i]['province'] == null) {
          countries1.add(ListTile(
            key: Key(jsonResall[i]['country']),
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
            key: Key(jsonResall[i]['province']),
            title: Text(
              jsonResall[i]['province'],
              style: GoogleFonts.lato(),
            ),
            trailing: Text(jsonResall[i]['country'].toString().toUpperCase(),
                style: GoogleFonts.lato()),
            onTap: () {
              Navigator.pop(context,
                  [jsonResall[i]['country'], jsonResall[i]['province']]);
            },
          ));
        }
=======
    var temp =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/jhucsse'));
    var jsonResall = convert.jsonDecode(temp.body);
    for (int i = 0; i < jsonResall.length; i++) {
      if (jsonResall[i]['province'] == null) {
        countries1.add(ListTile(
          key: Key(jsonResall[i]['country']),
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
          key: Key(jsonResall[i]['province']),
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
>>>>>>> 4f3af15 (Update)
      }
      if (mounted)
        setState(() {
          show = false;
          countries = countries1;
          states = states1;
          newCountry = List.from(countries1);
          newStates = List.from(states1);
        });
    });
  }

  @override
  void initState() {
    super.initState();
    places();
    _textController = TextEditingController();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: widget.switchVal ? themeDatadark : themeDatalight,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            controller: _scrollController,
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
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )),
                    Tab(
                        child: Text('States',
                            style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))))
                  ]),
                  shape: const RoundedRectangleBorder(
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
                              child: const Icon(Icons.search,
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
                                          .where((element) => element.key
                                              .toString()
                                              .substring(
                                                  3,
                                                  element.key
                                                          .toString()
                                                          .length -
                                                      3)
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                          .toList();
                                      newStates = states
                                          .where((element) => element.key
                                              .toString()
                                              .substring(
                                                  3,
                                                  element.key
                                                          .toString()
                                                          .length -
                                                      3)
                                              .toLowerCase()
                                              .contains(value.toLowerCase()))
                                          .toList();
                                    });
                                  },
                                  style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          color: widget.switchVal
                                              ? Colors.white
                                              : Colors.black)),
                                  prefix: const Center(
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
                                    color: widget.switchVal
                                        ? Colors.blueGrey[900]
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(47),
                                  ),
                                  controller: _textController,
                                ),
                              ),
                            ),
                            Expanded(child: Container())
                          ],
                        )),
                    stretchModes: const [
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
              return show
                  ? Center(child: const CircularProgressIndicator())
                  : CustomScrollView(
                      key: PageStorageKey<String>(name),
                      physics: const BouncingScrollPhysics(),
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
    );
  }
}
