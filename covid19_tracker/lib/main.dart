import 'package:flutter/material.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'citySelect.dart';
import 'aboutPage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'preventionPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData.dark(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        image: Image.asset('assets/Corona.png'),
        seconds: 3,
        navigateAfterSeconds: HomePage(),
        title: new Text(
          'Corona Tracker',
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  fontSize: 30,
                  color: Colors.white70,
                  fontWeight: FontWeight.w900)),
        ),
        backgroundColor: ThemeData.dark().primaryColor,
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selstate = '...';
  var selcountry = '...';
  var conf = '...';
  var recv = '...';
  var dead = '...';
  var updated = '...';
  var deathrate = '...';
  bool switchVal = true;
  bool separated = true;
  ThemeData themeDatadark = ThemeData.dark().copyWith(
      textTheme: GoogleFonts.latoTextTheme()
          .apply(bodyColor: Colors.white, displayColor: Colors.white));
  ThemeData themeDatalight = ThemeData.light().copyWith(
      textTheme: GoogleFonts.latoTextTheme()
          .apply(bodyColor: Colors.black, displayColor: Colors.black));
  List<String> pages = ['Corona', 'Prevention', 'About'];
  double maxYc = 0;
  double maxYr = 0;
  double maxYd = 0;
  double minYc = 0;
  double minYr = 0;
  double minYd = 0;
  List<Color> gradientColorsconf = [
    const Color(0xFFFF9800),
    const Color(0xFFFFA726),
  ];
  List<Color> gradientColorsrecv = [
    const Color(0xFF4CAF50),
    const Color(0xFF66BB6A),
  ];
  List<Color> gradientColorsdead = [
    const Color(0xFFF44336),
    const Color(0xFFEF5350),
  ];
  List<String> maxX = List.filled(14, '...');
  List<FlSpot> cases = [FlSpot(0, 0)];
  List<FlSpot> deaths = [FlSpot(0, 0)];
  List<FlSpot> recovered = [FlSpot(0, 0)];
  List<DataRow> rowdata = [
    DataRow(cells: [
      DataCell(Text(
        '...',
        style:
            GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.w600)),
      )),
      DataCell(Text(
        '...',
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(color: Colors.orange, fontWeight: FontWeight.w600)),
      )),
      DataCell(Text(
        '...',
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
      )),
      DataCell(Text(
        '...',
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
      ))
    ])
  ];

  final RefreshController _refreshController = RefreshController();
  Future<void> textBody(String country, String state) async {
    String countrytemp = country;
    setState(() {
      selcountry = '...';
      selstate = '...';
      conf = '...';
      recv = '...';
      dead = '...';
      updated = '...';
      deathrate = '...';
      maxYc = 0;
      maxYr = 0;
      maxYd = 0;
      minYc = 0;
      minYr = 0;
      minYd = 0;
      maxX = List.filled(14, '...');
      cases = [FlSpot(0, 0)];
      deaths = [FlSpot(0, 0)];
      recovered = [FlSpot(0, 0)];
      rowdata = [
        DataRow(cells: [
          DataCell(Text(
            '...',
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          )),
          DataCell(Text('...',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ))),
          DataCell(Text(
            '...',
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
          )),
          DataCell(Text('...',
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              )))
        ])
      ];
    });
    final prefs = await SharedPreferences.getInstance();
    switchVal = prefs.getBool('switch') ?? true;
    var temp = await http.get('https://disease.sh/v3/covid-19/jhucsse');
    var temphist = await http.get(
        'https://disease.sh/v3/covid-19/historical/${countrytemp.replaceAll('*', '')}?lastdays=14');
    if (temp.statusCode == 200) {
      var jsonRes = convert.jsonDecode(temp.body);
      var jsonResHist = convert.jsonDecode(temphist.body);
      List<FlSpot> cases1 = [];
      List<FlSpot> deaths1 = [];
      List<FlSpot> recovered1 = [];
      List<String> maxX1 = [];
      double ind = 0;
      List<DataRow> rowdata1 = [];
      for (String i in jsonResHist['timeline']['cases'].keys) {
        cases1.add(FlSpot(
            ind, double.parse(jsonResHist['timeline']['cases'][i].toString())));
        deaths1.add(FlSpot(ind,
            double.parse(jsonResHist['timeline']['deaths'][i].toString())));
        recovered1.add(FlSpot(ind,
            double.parse(jsonResHist['timeline']['recovered'][i].toString())));
        if (ind == 0) {
          minYc = double.parse(jsonResHist['timeline']['cases'][i].toString());
          minYr =
              double.parse(jsonResHist['timeline']['recovered'][i].toString());
          minYd = double.parse(jsonResHist['timeline']['deaths'][i].toString());
        }
        if (ind == 13) {
          maxYc = double.parse(jsonResHist['timeline']['cases'][i].toString());
          maxYr =
              double.parse(jsonResHist['timeline']['recovered'][i].toString());
          maxYd = double.parse(jsonResHist['timeline']['deaths'][i].toString());
        }
        maxX1.add((i.split('/'))[1]);
        if (ind > 8.0 && ind <= 13) {
          rowdata1.add(DataRow(cells: <DataCell>[
            DataCell(Text(
              i,
              style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            )),
            DataCell(Text(jsonResHist['timeline']['cases'][i].toString(),
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ))),
            DataCell(Text(jsonResHist['timeline']['recovered'][i].toString(),
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ))),
            DataCell(Text(
              jsonResHist['timeline']['deaths'][i].toString(),
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ))
          ]));
        }
        ind += 1;
      }
      for (int i = 0; i < jsonRes.length; i++) {
        if (jsonRes[i]['province'] == state &&
            jsonRes[i]['country'] == country) {
          setState(() {
            selcountry = jsonRes[i]['country'];
            selstate = jsonRes[i]['province'] == null
                ? ''
                : jsonRes[i]['province'].toString();
            conf = jsonRes[i]['stats']['confirmed'].toString();
            recv = jsonRes[i]['stats']['recovered'].toString();
            dead = jsonRes[i]['stats']['deaths'].toString();
            updated = jsonRes[i]['updatedAt'].toString();
            deathrate = ((int.tryParse(dead) / int.tryParse(conf)) * 100)
                .toStringAsFixed(2);
            cases = cases1;
            deaths = deaths1;
            recovered = recovered1;
            maxX = maxX1;
            rowdata = rowdata1;
          });
          break;
        }
      }
    } else {
      setState(() {
        selcountry = 'Error!!';
        selstate = 'Error!!';
        conf = 'Error!!';
        recv = 'Error!!';
        dead = 'Error!!';
        updated = 'Error!!';
        deathrate = 'Error!!';
      });
    }
  }

  void switchState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      switchVal = pref.getBool('switch') ?? true;
    });
  }

  void changeSwitch() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      switchVal = !(pref.getBool('switch') ?? true);
      pref.setBool('switch', switchVal);
    });
  }

  @override
  void initState() {
    super.initState();
    textBody('India', 'Delhi');
    switchState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: switchVal ? themeDatadark : themeDatalight,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar:
              TabBar(indicatorSize: TabBarIndicatorSize.label, tabs: [
            Tab(
                icon: Icon(FontAwesome5.virus,
                    color: switchVal ? Colors.white : Colors.black)),
            Tab(
                icon: Icon(RpgAwesome.health,
                    color: switchVal ? Colors.white : Colors.black)),
            Tab(
                icon: Icon(Icons.info,
                    color: switchVal ? Colors.white : Colors.black))
          ]),
          body: TabBarView(
              children: pages.map((String page) {
            if (page == pages[0]) {
              return Scaffold(
                key: PageStorageKey<String>(page),
                body: SafeArea(
                  child: SmartRefresher(
                    header: WaterDropHeader(),
                    onRefresh: () async {
                      await textBody(
                          selcountry, selstate == '' ? null : selstate);
                      _refreshController.refreshCompleted();
                    },
                    controller: _refreshController,
                    enablePullDown: true,
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          elevation: 100,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(20))),
                          actions: [
                            Switch(
                                value: switchVal,
                                onChanged: (g) {
                                  changeSwitch();
                                }),
                            IconButton(
                                enableFeedback: true,
                                icon: Hero(
                                    tag: 'search',
                                    child: Icon(Icons.search,
                                        color: Colors.white)),
                                onPressed: () async {
                                  final countrystate = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CitySelect(switchVal)));
                                  countrystate == null
                                      ? textBody(selcountry,
                                          selstate == '' ? null : selstate)
                                      : textBody(
                                          countrystate[0], countrystate[1]);
                                })
                          ],
                          expandedHeight: 200,
                          centerTitle: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Image.asset(
                                'assets/Corona.png',
                              ),
                            ),
                            centerTitle: true,
                            title: Text(
                              'Corona Tracker',
                              style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900)),
                            ),
                            stretchModes: [
                              StretchMode.zoomBackground,
                              StretchMode.blurBackground,
                              StretchMode.fadeTitle,
                            ],
                          ),
                          stretch: true,
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Center(
                                  child: Text('Updated on $updated',
                                      style: GoogleFonts.lato())),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 20, 0, 0),
                              child: selstate == ''
                                  ? ListTile(
                                      title: Text(
                                        selcountry,
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(fontSize: 30)),
                                      ),
                                    )
                                  : ListTile(
                                      title: Text(
                                        selstate,
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(fontSize: 30)),
                                      ),
                                      subtitle: Text(
                                        selcountry,
                                        style: GoogleFonts.lato(),
                                      ),
                                    ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Confirmed',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              conf,
                                              style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      color: Colors.orange,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w800)),
                                              textAlign: TextAlign.end,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Recovered',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              recv,
                                              style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w800)),
                                              textAlign: TextAlign.end,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Dead',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              dead,
                                              style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w800)),
                                              textAlign: TextAlign.end,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    elevation: 5,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Death Rate (%)',
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              deathrate,
                                              style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 40,
                                                      fontWeight:
                                                          FontWeight.w800)),
                                              textAlign: TextAlign.end,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Card(
                              margin: EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 5),
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 8),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Country Timeline: $selcountry',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: Colors.lightBlueAccent,
                                                fontSize: 25)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'for 2 weeks',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: switchVal
                                                    ? Colors.white70
                                                    : Colors.black87)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          110, 40, 110, 0),
                                      child: RaisedButton(
                                          color: Colors.blue[900],
                                          padding: EdgeInsets.all(11),
                                          child: separated == true
                                              ? Text(
                                                  'Combined',
                                                  style: GoogleFonts.lato(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )
                                              : Text(
                                                  'In-Depth',
                                                  style: GoogleFonts.lato(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                          onPressed: () {
                                            setState(() {
                                              separated = (!separated);
                                            });
                                          }),
                                    ),
                                    Visibility(
                                      visible: !separated,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 20, 40, 40),
                                        child: LineChart(
                                          LineChartData(
                                              gridData: FlGridData(show: false),
                                              borderData: FlBorderData(
                                                  show: true,
                                                  border: Border.all(
                                                      color: switchVal
                                                          ? Colors.white
                                                              .withOpacity(0.2)
                                                          : Colors.black
                                                              .withOpacity(0.2),
                                                      width: 0.2)),
                                              minX: 0,
                                              minY: minYd / 1.1,
                                              maxX: 13,
                                              maxY: (maxYc * 1.1),
                                              lineBarsData: [
                                                LineChartBarData(
                                                    dotData: FlDotData(
                                                      show: false,
                                                    ),
                                                    colors: gradientColorsconf,
                                                    spots: cases,
                                                    isCurved: true,
                                                    barWidth: 2,
                                                    isStrokeCapRound: true,
                                                    belowBarData: BarAreaData(
                                                        show: true,
                                                        colors: gradientColorsconf
                                                            .map((color) => color
                                                                .withOpacity(
                                                                    0.2))
                                                            .toList())),
                                                LineChartBarData(
                                                    dotData: FlDotData(
                                                      show: false,
                                                    ),
                                                    colors: gradientColorsrecv,
                                                    spots: recovered,
                                                    isCurved: true,
                                                    barWidth: 2,
                                                    isStrokeCapRound: true,
                                                    belowBarData: BarAreaData(
                                                        show: true,
                                                        colors: gradientColorsrecv
                                                            .map((color) => color
                                                                .withOpacity(
                                                                    0.2))
                                                            .toList())),
                                                LineChartBarData(
                                                    dotData: FlDotData(
                                                      show: false,
                                                    ),
                                                    colors: gradientColorsdead,
                                                    spots: deaths,
                                                    isCurved: true,
                                                    barWidth: 2,
                                                    isStrokeCapRound: true,
                                                    belowBarData: BarAreaData(
                                                        show: true,
                                                        colors: gradientColorsdead
                                                            .map((color) => color
                                                                .withOpacity(
                                                                    0.2))
                                                            .toList()))
                                              ],
                                              titlesData: FlTitlesData(
                                                show: true,
                                                bottomTitles: SideTitles(
                                                    rotateAngle: 45,
                                                    showTitles: true,
                                                    reservedSize: 15,
                                                    getTitles: (value) {
                                                      return maxX[value ~/ 1];
                                                    },
                                                    margin: 15,
                                                    textStyle: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            color: switchVal
                                                                ? Colors.white70
                                                                : Colors
                                                                    .black87,
                                                            fontSize: 10))),
                                                leftTitles: SideTitles(
                                                  interval: ((maxYc * 1.1) -
                                                              (minYd / 1.1)) ==
                                                          0
                                                      ? double.infinity
                                                      : ((maxYc * 1.1) -
                                                              (minYd / 1.1)) /
                                                          10,
                                                  reservedSize: 15,
                                                  showTitles: true,
                                                  getTitles: (value) {
                                                    if ((value ~/ 100000000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 3)}M';
                                                    else if ((value ~/
                                                            10000000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 2)}M';
                                                    else if ((value ~/
                                                            1000000) >=
                                                        1)
                                                      return '${(value / 1000000).toStringAsFixed(2)}M';
                                                    else if ((value ~/
                                                            100000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 3)}K';
                                                    else if ((value ~/ 10000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 2)}K';
                                                    else if ((value ~/ 1000) >=
                                                        1)
                                                      return '${(value / 1000).toStringAsFixed(2)}K';
                                                    else
                                                      return (value ~/ 1)
                                                          .toString();
                                                  },
                                                  textStyle: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          color: switchVal
                                                              ? Colors.white70
                                                              : Colors.black87,
                                                          fontSize: 10)),
                                                  margin: 20,
                                                ),
                                              )),
                                          swapAnimationDuration:
                                              Duration(milliseconds: 2),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: separated,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 40),
                                        child: Text('Confirmed',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.orange))),
                                      ),
                                    ),
                                    Visibility(
                                      visible: separated,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 20, 40, 40),
                                        child: LineChart(
                                          LineChartData(
                                              gridData: FlGridData(show: false),
                                              borderData: FlBorderData(
                                                  show: true,
                                                  border: Border.all(
                                                      color: switchVal
                                                          ? Colors.white
                                                              .withOpacity(0.2)
                                                          : Colors.black87,
                                                      width: 0.2)),
                                              minX: 0,
                                              minY: minYc / 1.1,
                                              maxX: 13,
                                              maxY: (maxYc * 1.1),
                                              lineBarsData: [
                                                LineChartBarData(
                                                    colors: gradientColorsconf,
                                                    spots: cases,
                                                    isCurved: true,
                                                    barWidth: 2,
                                                    isStrokeCapRound: true,
                                                    dotData: FlDotData(
                                                      show: false,
                                                    ),
                                                    belowBarData: BarAreaData(
                                                        show: true,
                                                        colors: gradientColorsconf
                                                            .map((color) => color
                                                                .withOpacity(
                                                                    0.2))
                                                            .toList())),
                                              ],
                                              titlesData: FlTitlesData(
                                                show: true,
                                                bottomTitles: SideTitles(
                                                    rotateAngle: 45,
                                                    showTitles: true,
                                                    reservedSize: 15,
                                                    getTitles: (value) {
                                                      return maxX[value ~/ 1];
                                                    },
                                                    margin: 15,
                                                    textStyle: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            color: switchVal
                                                                ? Colors.white70
                                                                : Colors
                                                                    .black87,
                                                            fontSize: 10))),
                                                leftTitles: SideTitles(
                                                  interval: ((maxYc * 1.1) -
                                                              (minYc / 1.1)) ==
                                                          0
                                                      ? double.infinity
                                                      : ((maxYc * 1.1) -
                                                              (minYc / 1.1)) /
                                                          10,
                                                  reservedSize: 15,
                                                  showTitles: true,
                                                  getTitles: (value) {
                                                    if ((value ~/ 100000000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 3)}M';
                                                    else if ((value ~/
                                                            10000000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 2)}M';
                                                    else if ((value ~/
                                                            1000000) >=
                                                        1)
                                                      return '${(value / 1000000).toStringAsFixed(2)}M';
                                                    else if ((value ~/
                                                            100000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 3)}K';
                                                    else if ((value ~/ 10000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 2)}K';
                                                    else if ((value ~/ 1000) >=
                                                        1)
                                                      return '${(value / 1000).toStringAsFixed(2)}K';
                                                    else
                                                      return (value ~/ 1)
                                                          .toString();
                                                  },
                                                  textStyle: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          color: switchVal
                                                              ? Colors.white70
                                                              : Colors.black87,
                                                          fontSize: 10)),
                                                  margin: 20,
                                                ),
                                              )),
                                          swapAnimationDuration:
                                              Duration(milliseconds: 2),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: separated,
                                      child: Text('Recovered',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              textStyle: TextStyle(
                                                  color: Colors.green))),
                                    ),
                                    Visibility(
                                      visible: separated,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 20, 40, 40),
                                        child: LineChart(
                                          LineChartData(
                                              gridData: FlGridData(show: false),
                                              borderData: FlBorderData(
                                                  show: true,
                                                  border: Border.all(
                                                      color: switchVal
                                                          ? Colors.white
                                                              .withOpacity(0.2)
                                                          : Colors.black
                                                              .withOpacity(0.2),
                                                      width: 0.2)),
                                              minX: 0,
                                              minY: minYr / 1.1,
                                              maxX: 13,
                                              maxY: (maxYr * 1.1),
                                              lineBarsData: [
                                                LineChartBarData(
                                                    colors: gradientColorsrecv,
                                                    spots: recovered,
                                                    isCurved: true,
                                                    barWidth: 2,
                                                    isStrokeCapRound: true,
                                                    dotData: FlDotData(
                                                      show: false,
                                                    ),
                                                    belowBarData: BarAreaData(
                                                        show: true,
                                                        colors: gradientColorsrecv
                                                            .map((color) => color
                                                                .withOpacity(
                                                                    0.2))
                                                            .toList())),
                                              ],
                                              titlesData: FlTitlesData(
                                                show: true,
                                                bottomTitles: SideTitles(
                                                    rotateAngle: 45,
                                                    showTitles: true,
                                                    reservedSize: 15,
                                                    getTitles: (value) {
                                                      return maxX[value ~/ 1];
                                                    },
                                                    margin: 15,
                                                    textStyle: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            color: switchVal
                                                                ? Colors.white70
                                                                : Colors
                                                                    .black87,
                                                            fontSize: 10))),
                                                leftTitles: SideTitles(
                                                  interval: ((maxYr * 1.1) -
                                                              (minYr / 1.1)) ==
                                                          0
                                                      ? double.infinity
                                                      : ((maxYr * 1.1) -
                                                              (minYr / 1.1)) /
                                                          10,
                                                  reservedSize: 15,
                                                  showTitles: true,
                                                  getTitles: (value) {
                                                    if ((value ~/ 100000000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 3)}M';
                                                    else if ((value ~/
                                                            10000000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 2)}M';
                                                    else if ((value ~/
                                                            1000000) >=
                                                        1)
                                                      return '${(value / 1000000).toStringAsFixed(2)}M';
                                                    else if ((value ~/
                                                            100000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 3)}K';
                                                    else if ((value ~/ 10000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 2)}K';
                                                    else if ((value ~/ 1000) >=
                                                        1)
                                                      return '${(value / 1000).toStringAsFixed(2)}K';
                                                    else
                                                      return (value ~/ 1)
                                                          .toString();
                                                  },
                                                  textStyle: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          color: switchVal
                                                              ? Colors.white70
                                                              : Colors.black87,
                                                          fontSize: 10)),
                                                  margin: 20,
                                                ),
                                              )),
                                          swapAnimationDuration:
                                              Duration(milliseconds: 2),
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: separated,
                                      child: Text('Deaths',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red))),
                                    ),
                                    Visibility(
                                      visible: separated,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 20, 40, 40),
                                        child: LineChart(
                                          LineChartData(
                                              gridData: FlGridData(show: false),
                                              borderData: FlBorderData(
                                                  show: true,
                                                  border: Border.all(
                                                      color: switchVal
                                                          ? Colors.white
                                                              .withOpacity(0.2)
                                                          : Colors.black
                                                              .withOpacity(0.2),
                                                      width: 0.2)),
                                              minX: 0,
                                              minY: minYd / 1.1,
                                              maxX: 13,
                                              maxY: (maxYd * 1.1),
                                              lineBarsData: [
                                                LineChartBarData(
                                                    colors: gradientColorsdead,
                                                    spots: deaths,
                                                    isCurved: true,
                                                    barWidth: 2,
                                                    isStrokeCapRound: true,
                                                    dotData: FlDotData(
                                                      show: false,
                                                    ),
                                                    belowBarData: BarAreaData(
                                                        show: true,
                                                        colors: gradientColorsdead
                                                            .map((color) => color
                                                                .withOpacity(
                                                                    0.2))
                                                            .toList()))
                                              ],
                                              titlesData: FlTitlesData(
                                                show: true,
                                                bottomTitles: SideTitles(
                                                    rotateAngle: 45,
                                                    showTitles: true,
                                                    reservedSize: 15,
                                                    getTitles: (value) {
                                                      return maxX[value ~/ 1];
                                                    },
                                                    margin: 15,
                                                    textStyle: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                            color: switchVal
                                                                ? Colors.white70
                                                                : Colors
                                                                    .black87,
                                                            fontSize: 10))),
                                                leftTitles: SideTitles(
                                                  interval: ((maxYd * 1.1) -
                                                              (minYd / 1.1)) ==
                                                          0
                                                      ? double.infinity
                                                      : ((maxYd * 1.1) -
                                                              (minYd / 1.1)) /
                                                          10,
                                                  reservedSize: 15,
                                                  showTitles: true,
                                                  getTitles: (value) {
                                                    if ((value ~/ 100000000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 3)}M';
                                                    else if ((value ~/
                                                            10000000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 2)}M';
                                                    else if ((value ~/
                                                            1000000) >=
                                                        1)
                                                      return '${(value / 1000000).toStringAsFixed(2)}M';
                                                    else if ((value ~/
                                                            100000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 3)}K';
                                                    else if ((value ~/ 10000) >=
                                                        1)
                                                      return '${value.toString().substring(0, 2)}K';
                                                    else if ((value ~/ 1000) >=
                                                        1)
                                                      return '${(value / 1000).toStringAsFixed(2)}K';
                                                    else
                                                      return (value ~/ 1)
                                                          .toString();
                                                  },
                                                  textStyle: GoogleFonts.lato(
                                                      textStyle: TextStyle(
                                                          color: switchVal
                                                              ? Colors.white70
                                                              : Colors.black87,
                                                          fontSize: 10)),
                                                  margin: 20,
                                                ),
                                              )),
                                          swapAnimationDuration:
                                              Duration(milliseconds: 2),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Card(
                              elevation: 5,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 8),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Country Data: $selcountry',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: Colors.lightBlueAccent,
                                                fontSize: 25)),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(8, 0, 0, 8),
                                      child: Text(
                                        'for 5 Days',
                                        style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                                color: switchVal
                                                    ? Colors.white70
                                                    : Colors.black87)),
                                      ),
                                    ),
                                    Divider(),
                                    DataTable(
                                      columns: [
                                        DataColumn(
                                            label: Text(
                                          'Date',
                                          style: GoogleFonts.lato(
                                              textStyle:
                                                  TextStyle(fontSize: 18)),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Conf.',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 18)),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Recv.',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18)),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Dead',
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18)),
                                        )),
                                      ],
                                      rows: rowdata,
                                      columnSpacing: 20,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                ),
              );
            } else if (page == pages[1])
              return Scaffold(
                  key: PageStorageKey<String>(page), body: PreventionPage());
            else
              return Scaffold(
                  key: PageStorageKey<String>(page), body: AboutPage());
          }).toList()),
        ),
      ),
    );
  }
}
