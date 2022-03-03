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
import 'package:responsive_grid/responsive_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Corona Tracker',
    home: MyApp(),
    theme: ThemeData.dark().copyWith(
        textTheme: GoogleFonts.latoTextTheme(),
        primaryTextTheme: GoogleFonts.latoTextTheme(),
        accentTextTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(textTheme: GoogleFonts.latoTextTheme())),
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
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
              textStyle: const TextStyle(
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
  var selstate, selcountry, conf, recv, dead, updated, deathrate = '...';
  bool switchVal = true;
  bool separated = true;
  ScrollController _scrollController;
  ThemeData themeDatadark = ThemeData.dark().copyWith(
      textTheme: GoogleFonts.latoTextTheme()
          .apply(bodyColor: Colors.white, displayColor: Colors.white));
  ThemeData themeDatalight = ThemeData.light().copyWith(
      textTheme: GoogleFonts.latoTextTheme()
          .apply(bodyColor: Colors.black, displayColor: Colors.black));
  List<String> pages = ['Corona', 'Prevention', 'About'];
  double maxYc, maxYr, minYc, minYd, maxYd, minYr = 0;
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
  List<FlSpot> cases, deaths, recovered = [FlSpot(0, 0)];
  List<DataRow> rowdata = [
<<<<<<< HEAD
    DataRow(
        cells: [1, 2, 3, 4]
            .map((e) => DataCell(Center(
                  child: Text(
                    '...',
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle:
                            const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                )))
            .toList())
=======
    DataRow(cells: [
      DataCell(Text(
        '...',
        textAlign: TextAlign.center,
        style:
            GoogleFonts.lato(textStyle: TextStyle(fontWeight: FontWeight.w600)),
      )),
      DataCell(Text(
        '...',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(color: Colors.orange, fontWeight: FontWeight.w600)),
      )),
      DataCell(Text(
        '...',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(color: Colors.green, fontWeight: FontWeight.w600)),
      )),
      DataCell(Text(
        '...',
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
            textStyle:
                TextStyle(color: Colors.red, fontWeight: FontWeight.w600)),
      ))
    ])
>>>>>>> 4f3af15 (Update)
  ];

  RefreshController _refreshController;
  Future<void> textBody(String country, String state) async {
    String countrytemp = country;
<<<<<<< HEAD
    if (mounted)
      setState(() {
        selcountry =
            selstate = conf = recv = dead = updated = deathrate = '...';
        maxYc = maxYr = maxYd = minYc = minYr = minYd = 0;
        maxX = List.filled(14, '...');
        cases = deaths = recovered = [FlSpot(0, 0)];
        rowdata = [
          DataRow(
              cells: [1, 2, 3, 4]
                  .map((e) => DataCell(Center(
                        child: Text(
                          '...',
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                              textStyle:
                                  TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      )))
                  .toList())
        ];
      });

=======
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
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle:
                    TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          )),
          DataCell(Text('...',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ))),
          DataCell(Text(
            '...',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
          )),
          DataCell(Text('...',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              )))
        ])
      ];
    });
>>>>>>> 4f3af15 (Update)
    final prefs = await SharedPreferences.getInstance();
    switchVal = prefs.getBool('switch') ?? true;
    var temp =
        await http.get(Uri.parse('https://disease.sh/v3/covid-19/jhucsse'));
    var temphist = await http.get(Uri.parse(
        'https://disease.sh/v3/covid-19/historical/${countrytemp.replaceAll('*', '')}?lastdays=14'));
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
<<<<<<< HEAD
            DataCell(Center(
              child: Text(
                i,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
              ),
            )),
            DataCell(Center(
              child: Text(jsonResHist['timeline']['cases'][i].toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            )),
            DataCell(Center(
              child: Text(jsonResHist['timeline']['recovered'][i].toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.green,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            )),
            DataCell(Center(
              child: Text(
                jsonResHist['timeline']['deaths'][i].toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    textStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
=======
            DataCell(Text(
              i,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            )),
            DataCell(Text(jsonResHist['timeline']['cases'][i].toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ))),
            DataCell(Text(jsonResHist['timeline']['recovered'][i].toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ))),
            DataCell(Text(
              jsonResHist['timeline']['deaths'][i].toString(),
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
>>>>>>> 4f3af15 (Update)
            ))
          ]));
        }
        ind += 1;
      }
      for (int i = 0; i < jsonRes.length; i++) {
        if (jsonRes[i]['province'] == state &&
            jsonRes[i]['country'] == country) {
          if (mounted)
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
      if (mounted)
        setState(() {
          selcountry =
              selstate = conf = recv = dead = updated = deathrate = 'Error!!';
        });
    }
  }

  void switchState() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (mounted)
      setState(() {
        switchVal = pref.getBool('switch') ?? true;
      });
  }

  void changeSwitch() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (mounted)
      setState(() {
        switchVal = !(pref.getBool('switch') ?? true);
        pref.setBool('switch', switchVal);
      });
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _refreshController = RefreshController();
    textBody('India', 'Delhi');
    switchState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Tracker',
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
                              selcountry, selstate == '' ? null : selstate)
                          .then(
                              (value) => _refreshController.refreshCompleted());
                    },
                    controller: _refreshController,
                    enablePullDown: true,
                    child: CustomScrollView(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          elevation: 100,
                          shape: const RoundedRectangleBorder(
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
                                    child: const Icon(Icons.search,
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
                              textAlign: TextAlign.center,
                              style: GoogleFonts.lato(
                                  textStyle: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900)),
                            ),
                            stretchModes: const [
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
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                  child: Text(
                                      'Updated on ${updated == '...' ? updated : updated.toString().split(' ').first.split('-').reversed.join('-') + updated.toString().substring(10, 16)}',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.lato())),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 20, 0, 0),
                              child: selstate == ''
                                  ? ListTile(
                                      title: Text(
                                        selcountry,
                                        style: GoogleFonts.lato(
                                            textStyle:
                                                const TextStyle(fontSize: 30)),
                                      ),
                                    )
                                  : ListTile(
                                      title: Text(
                                        selstate,
                                        style: GoogleFonts.lato(
                                            textStyle:
                                                const TextStyle(fontSize: 30)),
                                      ),
                                      subtitle: Text(
                                        selcountry,
                                        style: GoogleFonts.lato(),
                                      ),
                                    ),
                            ),
                            ResponsiveGridRow(
                              children: [
<<<<<<< HEAD
                                    ['Confirmed', conf, Colors.orange],
                                    ['Recovered', recv, Colors.green]
                                  ]
                                      .map(
                                        (e) => ResponsiveGridCol(
                                          xs: 12,
                                          lg: 3,
                                          xl: 3,
                                          sm: 6,
                                          md: 3,
                                          child: Card(
                                            elevation: 5,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15,
                                                      horizontal: 8),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  FittedBox(
                                                    fit: BoxFit.scaleDown,
                                                    child: Text(
                                                      e[0],
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.lato(
                                                          textStyle: TextStyle(
                                                              color: e[2],
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        e[1] == 'null'
                                                            ? '0'
                                                            : e[1],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                color: e[2],
                                                                fontSize: 40,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800)),
                                                        textAlign:
                                                            TextAlign.end,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
=======
                                ResponsiveGridCol(
                                  xs: 6,
                                  lg: 3,
                                  xl: 3,
                                  sm: 6,
                                  md: 3,
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
                                ResponsiveGridCol(
                                  xs: 6,
                                  lg: 3,
                                  xl: 3,
                                  sm: 6,
                                  md: 3,
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
>>>>>>> 4f3af15 (Update)
                                          ),
                                        ),
                                      )
                                      .toList() +
                                  [
                                    ['Dead', dead, Colors.red],
                                    ['Death Rate (%)', deathrate, Colors.blue]
                                  ]
                                      .map((e) => ResponsiveGridCol(
                                            xs: 6,
                                            lg: 3,
                                            xl: 3,
                                            sm: 6,
                                            md: 3,
                                            child: Card(
                                              elevation: 5,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15,
                                                        horizontal: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    FittedBox(
                                                      fit: BoxFit.scaleDown,
                                                      child: Text(
                                                        e[0],
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                color: e[2],
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 8.0),
                                                      child: FittedBox(
                                                        fit: BoxFit.scaleDown,
                                                        child: Text(
                                                          e[0] == 'Dead'
                                                              ? e[1] == 'null'
                                                                  ? '0'
                                                                  : e[1]
                                                              : e[1] == 'null'
                                                                  ? '0 %'
                                                                  : e[1],
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  color: e[2],
                                                                  fontSize: 40,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800)),
                                                          textAlign:
                                                              TextAlign.end,
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
<<<<<<< HEAD
                                          ))
                                      .toList(),
=======
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                ResponsiveGridCol(
                                  xs: 6,
                                  lg: 3,
                                  xl: 3,
                                  sm: 6,
                                  md: 3,
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
                                ResponsiveGridCol(
                                  xs: 6,
                                  lg: 3,
                                  xl: 3,
                                  sm: 6,
                                  md: 3,
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
>>>>>>> 4f3af15 (Update)
                            ),
                            Card(
                              margin: const EdgeInsets.symmetric(
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
                                            textStyle: const TextStyle(
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
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.blue[900],
<<<<<<< HEAD
                                            padding: const EdgeInsets.symmetric(
=======
                                            padding: EdgeInsets.symmetric(
>>>>>>> 4f3af15 (Update)
                                                vertical: 20, horizontal: 11),
                                          ),
                                          child: separated == true
                                              ? FittedBox(
                                                  fit: BoxFit.fitHeight,
                                                  child: Text(
                                                    'Combined',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: GoogleFonts.lato(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                )
                                              : FittedBox(
                                                  fit: BoxFit.fitHeight,
                                                  child: Text(
                                                    'In-Depth',
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.lato(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                          onPressed: () {
                                            if (mounted)
                                              setState(() {
                                                separated = (!separated);
                                              });
                                          }),
                                    ),
                                    ResponsiveGridRow(
                                      children: [
                                        ResponsiveGridCol(
                                          xs: 12,
                                          sm: 12,
                                          md: 2,
                                          lg: 3,
                                          xl: 3,
                                          child: Container(
                                            width: 100,
                                          ),
<<<<<<< HEAD
                                        ),
                                        ResponsiveGridCol(
                                          xs: 12,
                                          sm: 12,
                                          md: 8,
                                          lg: 6,
                                          xl: 6,
                                          child: Visibility(
                                            visible: !separated,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      40, 20, 40, 0),
                                              child: LineChart(
                                                LineChartData(
                                                    gridData:
                                                        FlGridData(show: false),
                                                    borderData: FlBorderData(
                                                        show: true,
                                                        border: Border.all(
                                                            color: switchVal
                                                                ? Colors.white
                                                                    .withOpacity(
                                                                        0.2)
                                                                : Colors.black
                                                                    .withOpacity(
                                                                        0.2),
                                                            width: 0.2)),
                                                    minX: 0,
                                                    minY: (minYd / 1.1)
                                                        .floorToDouble(),
                                                    maxX: 13,
                                                    maxY: (maxYc * 1.1)
                                                        .ceilToDouble(),
                                                    lineBarsData: [
                                                      LineChartBarData(
                                                          dotData: FlDotData(
                                                            show: false,
                                                          ),
                                                          colors:
                                                              gradientColorsconf,
                                                          spots: cases,
                                                          isCurved: true,
                                                          barWidth: 2,
                                                          isStrokeCapRound:
                                                              true,
                                                          belowBarData: BarAreaData(
                                                              show: true,
                                                              colors: gradientColorsconf
                                                                  .map((color) =>
                                                                      color.withOpacity(
                                                                          0.2))
                                                                  .toList())),
                                                      LineChartBarData(
                                                          dotData: FlDotData(
                                                            show: false,
                                                          ),
                                                          colors:
                                                              gradientColorsrecv,
                                                          spots: recovered,
                                                          isCurved: true,
                                                          barWidth: 2,
                                                          isStrokeCapRound:
                                                              true,
                                                          belowBarData: BarAreaData(
                                                              show: true,
                                                              colors: gradientColorsrecv
                                                                  .map((color) =>
                                                                      color.withOpacity(
                                                                          0.2))
                                                                  .toList())),
                                                      LineChartBarData(
                                                          dotData: FlDotData(
                                                            show: false,
                                                          ),
                                                          colors:
                                                              gradientColorsdead,
                                                          spots: deaths,
                                                          isCurved: true,
                                                          barWidth: 2,
                                                          isStrokeCapRound:
                                                              true,
                                                          belowBarData: BarAreaData(
                                                              show: true,
                                                              colors: gradientColorsdead
                                                                  .map((color) =>
                                                                      color.withOpacity(
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
                                                            return maxX[
                                                                value ~/ 1];
                                                          },
                                                          margin: 15,
                                                          textStyle: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  color: switchVal
                                                                      ? Colors
                                                                          .white70
                                                                      : Colors
                                                                          .black87,
                                                                  fontSize:
                                                                      10))),
                                                      leftTitles: SideTitles(
                                                        interval: ((maxYc * 1.1)
                                                                        .floorToDouble() -
                                                                    (minYd /
                                                                            1.1)
                                                                        .floorToDouble()) ==
                                                                0
                                                            ? double.infinity
                                                            : (((maxYc * 1.1)
                                                                            .floorToDouble() -
                                                                        (minYd /
                                                                                1.1)
                                                                            .floorToDouble()) /
                                                                    10)
                                                                .ceilToDouble(),
                                                        reservedSize: 15,
                                                        showTitles: true,
                                                        getTitles: (value) {
                                                          if ((value ~/
                                                                  100000000) >=
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
                                                          else if ((value ~/
                                                                  10000) >=
                                                              1)
                                                            return '${value.toString().substring(0, 2)}K';
                                                          else if ((value ~/
                                                                  1000) >=
                                                              1)
                                                            return '${(value / 1000).toStringAsFixed(2)}K';
                                                          else
                                                            return (value ~/ 1)
                                                                .toString();
                                                        },
                                                        textStyle: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                color: switchVal
                                                                    ? Colors
                                                                        .white70
                                                                    : Colors
                                                                        .black87,
                                                                fontSize: 10)),
                                                        margin: 20,
                                                      ),
                                                    )),
                                                swapAnimationDuration:
                                                    const Duration(
                                                        milliseconds: 2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ResponsiveGridCol(
                                          xs: 12,
                                          sm: 12,
                                          md: 2,
                                          lg: 3,
                                          xl: 3,
                                          child: Container(
                                            width: 100,
                                          ),
                                        )
                                      ],
                                    ),
                                    ResponsiveGridRow(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ResponsiveGridCol(
                                          sm: 12,
                                          lg: 4,
                                          xl: 4,
                                          md: 6,
                                          xs: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Visibility(
                                                visible: separated,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40),
                                                  child: Text('Confirmed',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.lato(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .orange))),
                                                ),
                                              ),
                                              Visibility(
                                                visible: separated,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          40, 20, 40, 0),
                                                  child: LineChart(
                                                    LineChartData(
                                                        gridData: FlGridData(
                                                            show: false),
                                                        borderData: FlBorderData(
                                                            show: true,
                                                            border: Border.all(
                                                                color: switchVal
                                                                    ? Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.2)
                                                                    : Colors
                                                                        .black87,
                                                                width: 0.2)),
                                                        minX: 0,
                                                        minY: (minYc / 1.1)
                                                            .floorToDouble(),
                                                        maxX: 13,
                                                        maxY: (maxYc * 1.1)
                                                            .ceilToDouble(),
                                                        lineBarsData: [
                                                          LineChartBarData(
                                                              colors:
                                                                  gradientColorsconf,
                                                              spots: cases,
                                                              isCurved: true,
                                                              barWidth: 2,
                                                              isStrokeCapRound:
                                                                  true,
                                                              dotData:
                                                                  FlDotData(
                                                                show: false,
                                                              ),
                                                              belowBarData: BarAreaData(
                                                                  show: true,
                                                                  colors: gradientColorsconf
                                                                      .map((color) =>
                                                                          color.withOpacity(
                                                                              0.2))
                                                                      .toList())),
                                                        ],
                                                        titlesData:
                                                            FlTitlesData(
                                                          show: true,
                                                          bottomTitles:
                                                              SideTitles(
                                                                  rotateAngle:
                                                                      45,
                                                                  showTitles:
                                                                      true,
                                                                  reservedSize:
                                                                      15,
                                                                  getTitles:
                                                                      (value) {
                                                                    return maxX[
                                                                        value ~/
                                                                            1];
                                                                  },
                                                                  margin: 15,
                                                                  textStyle: GoogleFonts.lato(
                                                                      textStyle: TextStyle(
                                                                          color: switchVal
                                                                              ? Colors.white70
                                                                              : Colors.black87,
                                                                          fontSize: 10))),
                                                          leftTitles:
                                                              SideTitles(
                                                            interval: ((maxYc * 1.1)
                                                                            .floorToDouble() -
                                                                        (minYc / 1.1)
                                                                            .floorToDouble()) ==
                                                                    0
                                                                ? double
                                                                    .infinity
                                                                : (((maxYc * 1.1).floorToDouble() -
                                                                            (minYc / 1.1).floorToDouble()) /
                                                                        10)
                                                                    .ceilToDouble(),
                                                            reservedSize: 15,
                                                            showTitles: true,
                                                            getTitles: (value) {
                                                              if ((value ~/
                                                                      100000000) >=
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
                                                              else if ((value ~/
                                                                      10000) >=
                                                                  1)
                                                                return '${value.toString().substring(0, 2)}K';
                                                              else if ((value ~/
                                                                      1000) >=
                                                                  1)
                                                                return '${(value / 1000).toStringAsFixed(2)}K';
                                                              else
                                                                return (value ~/
                                                                        1)
                                                                    .toString();
                                                            },
                                                            textStyle: GoogleFonts.lato(
                                                                textStyle: TextStyle(
                                                                    color: switchVal
                                                                        ? Colors
                                                                            .white70
                                                                        : Colors
                                                                            .black87,
                                                                    fontSize:
                                                                        10)),
                                                            margin: 20,
                                                          ),
                                                        )),
                                                    swapAnimationDuration:
                                                        const Duration(
                                                            milliseconds: 2),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ResponsiveGridCol(
                                          sm: 12,
                                          lg: 4,
                                          xl: 4,
                                          md: 6,
                                          xs: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Visibility(
                                                visible: separated,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40),
                                                  child: Text('Recovered',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.lato(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          textStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green))),
                                                ),
                                              ),
                                              Visibility(
                                                visible: separated,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          40, 20, 40, 0),
                                                  child: LineChart(
                                                    LineChartData(
                                                        gridData: FlGridData(
                                                            show: false),
                                                        borderData: FlBorderData(
                                                            show: true,
                                                            border: Border.all(
                                                                color: switchVal
                                                                    ? Colors.white
                                                                        .withOpacity(
                                                                            0.2)
                                                                    : Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.2),
                                                                width: 0.2)),
                                                        minX: 0,
                                                        minY: (minYr / 1.1)
                                                            .floorToDouble(),
                                                        maxX: 13,
                                                        maxY: (maxYr * 1.1)
                                                            .ceilToDouble(),
                                                        lineBarsData: [
                                                          LineChartBarData(
                                                              colors:
                                                                  gradientColorsrecv,
                                                              spots: recovered,
                                                              isCurved: true,
                                                              barWidth: 2,
                                                              isStrokeCapRound:
                                                                  true,
                                                              dotData:
                                                                  FlDotData(
                                                                show: false,
                                                              ),
                                                              belowBarData: BarAreaData(
                                                                  show: true,
                                                                  colors: gradientColorsrecv
                                                                      .map((color) =>
                                                                          color.withOpacity(
                                                                              0.2))
                                                                      .toList())),
                                                        ],
                                                        titlesData:
                                                            FlTitlesData(
                                                          show: true,
                                                          bottomTitles:
                                                              SideTitles(
                                                                  rotateAngle:
                                                                      45,
                                                                  showTitles:
                                                                      true,
                                                                  reservedSize:
                                                                      15,
                                                                  getTitles:
                                                                      (value) {
                                                                    return maxX[
                                                                        value ~/
                                                                            1];
                                                                  },
                                                                  margin: 15,
                                                                  textStyle: GoogleFonts.lato(
                                                                      textStyle: TextStyle(
                                                                          color: switchVal
                                                                              ? Colors.white70
                                                                              : Colors.black87,
                                                                          fontSize: 10))),
                                                          leftTitles:
                                                              SideTitles(
                                                            interval: ((maxYr * 1.1)
                                                                            .floorToDouble() -
                                                                        (minYr / 1.1)
                                                                            .floorToDouble()) ==
                                                                    0
                                                                ? double
                                                                    .infinity
                                                                : (((maxYr * 1.1).floorToDouble() -
                                                                            (minYr / 1.1).floorToDouble()) /
                                                                        10)
                                                                    .ceilToDouble(),
                                                            reservedSize: 15,
                                                            showTitles: true,
                                                            getTitles: (value) {
                                                              if ((value ~/
                                                                      100000000) >=
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
                                                              else if ((value ~/
                                                                      10000) >=
                                                                  1)
                                                                return '${value.toString().substring(0, 2)}K';
                                                              else if ((value ~/
                                                                      1000) >=
                                                                  1)
                                                                return '${(value / 1000).toStringAsFixed(2)}K';
                                                              else
                                                                return (value ~/
                                                                        1)
                                                                    .toString();
                                                            },
                                                            textStyle: GoogleFonts.lato(
                                                                textStyle: TextStyle(
                                                                    color: switchVal
                                                                        ? Colors
                                                                            .white70
                                                                        : Colors
                                                                            .black87,
                                                                    fontSize:
                                                                        10)),
                                                            margin: 20,
                                                          ),
                                                        )),
                                                    swapAnimationDuration:
                                                        const Duration(
                                                            milliseconds: 2),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ResponsiveGridCol(
=======
                                        ),
                                        ResponsiveGridCol(
                                          xs: 12,
                                          sm: 12,
                                          md: 8,
                                          lg: 6,
                                          xl: 6,
                                          child: Visibility(
                                            visible: !separated,
                                            child: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  40, 20, 40, 0),
                                              child: LineChart(
                                                LineChartData(
                                                    gridData:
                                                        FlGridData(show: false),
                                                    borderData: FlBorderData(
                                                        show: true,
                                                        border: Border.all(
                                                            color: switchVal
                                                                ? Colors.white
                                                                    .withOpacity(
                                                                        0.2)
                                                                : Colors.black
                                                                    .withOpacity(
                                                                        0.2),
                                                            width: 0.2)),
                                                    minX: 0,
                                                    minY: (minYd / 1.1)
                                                        .floorToDouble(),
                                                    maxX: 13,
                                                    maxY: (maxYc * 1.1)
                                                        .ceilToDouble(),
                                                    lineBarsData: [
                                                      LineChartBarData(
                                                          dotData: FlDotData(
                                                            show: false,
                                                          ),
                                                          colors:
                                                              gradientColorsconf,
                                                          spots: cases,
                                                          isCurved: true,
                                                          barWidth: 2,
                                                          isStrokeCapRound:
                                                              true,
                                                          belowBarData: BarAreaData(
                                                              show: true,
                                                              colors: gradientColorsconf
                                                                  .map((color) =>
                                                                      color.withOpacity(
                                                                          0.2))
                                                                  .toList())),
                                                      LineChartBarData(
                                                          dotData: FlDotData(
                                                            show: false,
                                                          ),
                                                          colors:
                                                              gradientColorsrecv,
                                                          spots: recovered,
                                                          isCurved: true,
                                                          barWidth: 2,
                                                          isStrokeCapRound:
                                                              true,
                                                          belowBarData: BarAreaData(
                                                              show: true,
                                                              colors: gradientColorsrecv
                                                                  .map((color) =>
                                                                      color.withOpacity(
                                                                          0.2))
                                                                  .toList())),
                                                      LineChartBarData(
                                                          dotData: FlDotData(
                                                            show: false,
                                                          ),
                                                          colors:
                                                              gradientColorsdead,
                                                          spots: deaths,
                                                          isCurved: true,
                                                          barWidth: 2,
                                                          isStrokeCapRound:
                                                              true,
                                                          belowBarData: BarAreaData(
                                                              show: true,
                                                              colors: gradientColorsdead
                                                                  .map((color) =>
                                                                      color.withOpacity(
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
                                                            return maxX[
                                                                value ~/ 1];
                                                          },
                                                          margin: 15,
                                                          textStyle: GoogleFonts.lato(
                                                              textStyle: TextStyle(
                                                                  color: switchVal
                                                                      ? Colors
                                                                          .white70
                                                                      : Colors
                                                                          .black87,
                                                                  fontSize:
                                                                      10))),
                                                      leftTitles: SideTitles(
                                                        interval: ((maxYc * 1.1)
                                                                        .floorToDouble() -
                                                                    (minYd /
                                                                            1.1)
                                                                        .floorToDouble()) ==
                                                                0
                                                            ? double.infinity
                                                            : (((maxYc * 1.1)
                                                                            .floorToDouble() -
                                                                        (minYd /
                                                                                1.1)
                                                                            .floorToDouble()) /
                                                                    10)
                                                                .ceilToDouble(),
                                                        reservedSize: 15,
                                                        showTitles: true,
                                                        getTitles: (value) {
                                                          if ((value ~/
                                                                  100000000) >=
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
                                                          else if ((value ~/
                                                                  10000) >=
                                                              1)
                                                            return '${value.toString().substring(0, 2)}K';
                                                          else if ((value ~/
                                                                  1000) >=
                                                              1)
                                                            return '${(value / 1000).toStringAsFixed(2)}K';
                                                          else
                                                            return (value ~/ 1)
                                                                .toString();
                                                        },
                                                        textStyle: GoogleFonts.lato(
                                                            textStyle: TextStyle(
                                                                color: switchVal
                                                                    ? Colors
                                                                        .white70
                                                                    : Colors
                                                                        .black87,
                                                                fontSize: 10)),
                                                        margin: 20,
                                                      ),
                                                    )),
                                                swapAnimationDuration:
                                                    Duration(milliseconds: 2),
                                              ),
                                            ),
                                          ),
                                        ),
                                        ResponsiveGridCol(
                                          xs: 12,
                                          sm: 12,
                                          md: 2,
                                          lg: 3,
                                          xl: 3,
                                          child: Container(
                                            width: 100,
                                          ),
                                        )
                                      ],
                                    ),
                                    ResponsiveGridRow(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ResponsiveGridCol(
                                          sm: 12,
                                          lg: 4,
                                          xl: 4,
                                          md: 6,
                                          xs: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Visibility(
                                                visible: separated,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40),
                                                  child: Text('Confirmed',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.lato(
                                                          textStyle: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .orange))),
                                                ),
                                              ),
                                              Visibility(
                                                visible: separated,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          40, 20, 40, 0),
                                                  child: LineChart(
                                                    LineChartData(
                                                        gridData: FlGridData(
                                                            show: false),
                                                        borderData: FlBorderData(
                                                            show: true,
                                                            border: Border.all(
                                                                color: switchVal
                                                                    ? Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.2)
                                                                    : Colors
                                                                        .black87,
                                                                width: 0.2)),
                                                        minX: 0,
                                                        minY: (minYc / 1.1)
                                                            .floorToDouble(),
                                                        maxX: 13,
                                                        maxY: (maxYc * 1.1)
                                                            .ceilToDouble(),
                                                        lineBarsData: [
                                                          LineChartBarData(
                                                              colors:
                                                                  gradientColorsconf,
                                                              spots: cases,
                                                              isCurved: true,
                                                              barWidth: 2,
                                                              isStrokeCapRound:
                                                                  true,
                                                              dotData:
                                                                  FlDotData(
                                                                show: false,
                                                              ),
                                                              belowBarData: BarAreaData(
                                                                  show: true,
                                                                  colors: gradientColorsconf
                                                                      .map((color) =>
                                                                          color.withOpacity(
                                                                              0.2))
                                                                      .toList())),
                                                        ],
                                                        titlesData:
                                                            FlTitlesData(
                                                          show: true,
                                                          bottomTitles:
                                                              SideTitles(
                                                                  rotateAngle:
                                                                      45,
                                                                  showTitles:
                                                                      true,
                                                                  reservedSize:
                                                                      15,
                                                                  getTitles:
                                                                      (value) {
                                                                    return maxX[
                                                                        value ~/
                                                                            1];
                                                                  },
                                                                  margin: 15,
                                                                  textStyle: GoogleFonts.lato(
                                                                      textStyle: TextStyle(
                                                                          color: switchVal
                                                                              ? Colors.white70
                                                                              : Colors.black87,
                                                                          fontSize: 10))),
                                                          leftTitles:
                                                              SideTitles(
                                                            interval: ((maxYc * 1.1)
                                                                            .floorToDouble() -
                                                                        (minYc / 1.1)
                                                                            .floorToDouble()) ==
                                                                    0
                                                                ? double
                                                                    .infinity
                                                                : (((maxYc * 1.1).floorToDouble() -
                                                                            (minYc / 1.1).floorToDouble()) /
                                                                        10)
                                                                    .ceilToDouble(),
                                                            reservedSize: 15,
                                                            showTitles: true,
                                                            getTitles: (value) {
                                                              if ((value ~/
                                                                      100000000) >=
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
                                                              else if ((value ~/
                                                                      10000) >=
                                                                  1)
                                                                return '${value.toString().substring(0, 2)}K';
                                                              else if ((value ~/
                                                                      1000) >=
                                                                  1)
                                                                return '${(value / 1000).toStringAsFixed(2)}K';
                                                              else
                                                                return (value ~/
                                                                        1)
                                                                    .toString();
                                                            },
                                                            textStyle: GoogleFonts.lato(
                                                                textStyle: TextStyle(
                                                                    color: switchVal
                                                                        ? Colors
                                                                            .white70
                                                                        : Colors
                                                                            .black87,
                                                                    fontSize:
                                                                        10)),
                                                            margin: 20,
                                                          ),
                                                        )),
                                                    swapAnimationDuration:
                                                        Duration(
                                                            milliseconds: 2),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ResponsiveGridCol(
                                          sm: 12,
                                          lg: 4,
                                          xl: 4,
                                          md: 6,
                                          xs: 12,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              Visibility(
                                                visible: separated,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 40),
                                                  child: Text('Recovered',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: GoogleFonts.lato(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          textStyle: TextStyle(
                                                              color: Colors
                                                                  .green))),
                                                ),
                                              ),
                                              Visibility(
                                                visible: separated,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          40, 20, 40, 0),
                                                  child: LineChart(
                                                    LineChartData(
                                                        gridData: FlGridData(
                                                            show: false),
                                                        borderData: FlBorderData(
                                                            show: true,
                                                            border: Border.all(
                                                                color: switchVal
                                                                    ? Colors.white
                                                                        .withOpacity(
                                                                            0.2)
                                                                    : Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.2),
                                                                width: 0.2)),
                                                        minX: 0,
                                                        minY: (minYr / 1.1)
                                                            .floorToDouble(),
                                                        maxX: 13,
                                                        maxY: (maxYr * 1.1)
                                                            .ceilToDouble(),
                                                        lineBarsData: [
                                                          LineChartBarData(
                                                              colors:
                                                                  gradientColorsrecv,
                                                              spots: recovered,
                                                              isCurved: true,
                                                              barWidth: 2,
                                                              isStrokeCapRound:
                                                                  true,
                                                              dotData:
                                                                  FlDotData(
                                                                show: false,
                                                              ),
                                                              belowBarData: BarAreaData(
                                                                  show: true,
                                                                  colors: gradientColorsrecv
                                                                      .map((color) =>
                                                                          color.withOpacity(
                                                                              0.2))
                                                                      .toList())),
                                                        ],
                                                        titlesData:
                                                            FlTitlesData(
                                                          show: true,
                                                          bottomTitles:
                                                              SideTitles(
                                                                  rotateAngle:
                                                                      45,
                                                                  showTitles:
                                                                      true,
                                                                  reservedSize:
                                                                      15,
                                                                  getTitles:
                                                                      (value) {
                                                                    return maxX[
                                                                        value ~/
                                                                            1];
                                                                  },
                                                                  margin: 15,
                                                                  textStyle: GoogleFonts.lato(
                                                                      textStyle: TextStyle(
                                                                          color: switchVal
                                                                              ? Colors.white70
                                                                              : Colors.black87,
                                                                          fontSize: 10))),
                                                          leftTitles:
                                                              SideTitles(
                                                            interval: ((maxYr * 1.1)
                                                                            .floorToDouble() -
                                                                        (minYr / 1.1)
                                                                            .floorToDouble()) ==
                                                                    0
                                                                ? double
                                                                    .infinity
                                                                : (((maxYr * 1.1).floorToDouble() -
                                                                            (minYr / 1.1).floorToDouble()) /
                                                                        10)
                                                                    .ceilToDouble(),
                                                            reservedSize: 15,
                                                            showTitles: true,
                                                            getTitles: (value) {
                                                              if ((value ~/
                                                                      100000000) >=
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
                                                              else if ((value ~/
                                                                      10000) >=
                                                                  1)
                                                                return '${value.toString().substring(0, 2)}K';
                                                              else if ((value ~/
                                                                      1000) >=
                                                                  1)
                                                                return '${(value / 1000).toStringAsFixed(2)}K';
                                                              else
                                                                return (value ~/
                                                                        1)
                                                                    .toString();
                                                            },
                                                            textStyle: GoogleFonts.lato(
                                                                textStyle: TextStyle(
                                                                    color: switchVal
                                                                        ? Colors
                                                                            .white70
                                                                        : Colors
                                                                            .black87,
                                                                    fontSize:
                                                                        10)),
                                                            margin: 20,
                                                          ),
                                                        )),
                                                    swapAnimationDuration:
                                                        Duration(
                                                            milliseconds: 2),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        ResponsiveGridCol(
>>>>>>> 4f3af15 (Update)
                                            sm: 12,
                                            lg: 4,
                                            xl: 4,
                                            md: 12,
                                            xs: 12,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Visibility(
                                                  visible: separated,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 40),
                                                    child: Text('Deaths',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: GoogleFonts.lato(
<<<<<<< HEAD
                                                            textStyle:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .red))),
=======
                                                            textStyle: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .red))),
>>>>>>> 4f3af15 (Update)
                                                  ),
                                                ),
                                                Visibility(
                                                  visible: separated,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        40, 20, 40, 0),
                                                    child: LineChart(
                                                      LineChartData(
                                                          gridData: FlGridData(
                                                              show: false),
                                                          borderData: FlBorderData(
                                                              show: true,
                                                              border: Border.all(
                                                                  color: switchVal
                                                                      ? Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.2)
                                                                      : Colors
                                                                          .black
                                                                          .withOpacity(
                                                                              0.2),
                                                                  width: 0.2)),
                                                          minX: 0,
                                                          minY: (minYd / 1.1)
                                                              .floorToDouble(),
                                                          maxX: 13,
                                                          maxY: (maxYd * 1.1)
                                                              .ceilToDouble(),
                                                          lineBarsData: [
                                                            LineChartBarData(
                                                                colors:
                                                                    gradientColorsdead,
                                                                spots: deaths,
                                                                isCurved: true,
                                                                barWidth: 2,
                                                                isStrokeCapRound:
                                                                    true,
                                                                dotData:
                                                                    FlDotData(
                                                                  show: false,
                                                                ),
                                                                belowBarData: BarAreaData(
                                                                    show: true,
                                                                    colors: gradientColorsdead
                                                                        .map((color) =>
                                                                            color.withOpacity(0.2))
                                                                        .toList()))
                                                          ],
                                                          titlesData:
                                                              FlTitlesData(
                                                            show: true,
                                                            bottomTitles:
                                                                SideTitles(
                                                                    rotateAngle:
                                                                        45,
                                                                    showTitles:
                                                                        true,
                                                                    reservedSize:
                                                                        15,
                                                                    getTitles:
                                                                        (value) {
                                                                      return maxX[
                                                                          value ~/
                                                                              1];
                                                                    },
                                                                    margin: 15,
                                                                    textStyle: GoogleFonts.lato(
                                                                        textStyle: TextStyle(
                                                                            color: switchVal
                                                                                ? Colors.white70
                                                                                : Colors.black87,
                                                                            fontSize: 10))),
                                                            leftTitles:
                                                                SideTitles(
                                                              interval: ((maxYd * 1.1)
                                                                              .floorToDouble() -
                                                                          (minYd / 1.1)
                                                                              .floorToDouble()) ==
                                                                      0
                                                                  ? double
                                                                      .infinity
                                                                  : (((maxYd * 1.1).floorToDouble() -
                                                                              (minYd / 1.1).floorToDouble()) /
                                                                          10)
                                                                      .ceilToDouble(),
                                                              reservedSize: 15,
                                                              showTitles: true,
                                                              getTitles:
                                                                  (value) {
                                                                if ((value ~/
                                                                        100000000) >=
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
                                                                else if ((value ~/
                                                                        10000) >=
                                                                    1)
                                                                  return '${value.toString().substring(0, 2)}K';
                                                                else if ((value ~/
                                                                        1000) >=
                                                                    1)
                                                                  return '${(value / 1000).toStringAsFixed(2)}K';
                                                                else
                                                                  return (value ~/
                                                                          1)
                                                                      .toString();
                                                              },
                                                              textStyle: GoogleFonts.lato(
                                                                  textStyle: TextStyle(
                                                                      color: switchVal
                                                                          ? Colors
                                                                              .white70
                                                                          : Colors
                                                                              .black87,
                                                                      fontSize:
                                                                          10)),
                                                              margin: 20,
                                                            ),
                                                          )),
                                                      swapAnimationDuration:
<<<<<<< HEAD
                                                          const Duration(
=======
                                                          Duration(
>>>>>>> 4f3af15 (Update)
                                                              milliseconds: 2),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    SizedBox(height: 20)
                                  ],
                                ),
                              ),
                            ),
                            Card(
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
                                        'Country Data: $selcountry',
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
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
<<<<<<< HEAD
                                    MediaQuery.of(context).size.width >= 405
                                        ? DataTable(
                                            columns: [
                                              DataColumn(
                                                  label: Expanded(
                                                child: Text(
                                                  'Date',
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.lato(
                                                      textStyle:
                                                          const TextStyle(
                                                              fontSize: 18)),
                                                ),
                                              )),
                                              DataColumn(
                                                  label: Expanded(
                                                child: Text(
                                                  'Confirmed',
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.lato(
                                                      textStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.orange,
                                                              fontSize: 18)),
                                                ),
                                              )),
                                              DataColumn(
                                                  label: Expanded(
                                                child: Text(
                                                  'Recovered',
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.lato(
                                                      textStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.green,
                                                              fontSize: 18)),
                                                ),
                                              )),
                                              DataColumn(
                                                  label: Expanded(
                                                child: Text(
                                                  'Dead',
                                                  maxLines: 1,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.lato(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 18)),
                                                ),
                                              )),
                                            ],
                                            rows: rowdata,
                                            columnSpacing: 20,
                                          )
                                        : SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: FittedBox(
                                              child: DataTable(
                                                columns: [
                                                  DataColumn(
                                                      label: Expanded(
                                                    child: Text(
                                                      'Date',
                                                      maxLines: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.lato(
                                                          textStyle:
                                                              const TextStyle(
                                                                  fontSize:
                                                                      18)),
                                                    ),
                                                  )),
                                                  DataColumn(
                                                      label: Expanded(
                                                    child: Text(
                                                      'Confirmed',
                                                      maxLines: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.lato(
                                                          textStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .orange,
                                                                  fontSize:
                                                                      18)),
                                                    ),
                                                  )),
                                                  DataColumn(
                                                      label: Expanded(
                                                    child: Text(
                                                      'Recovered',
                                                      maxLines: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.lato(
                                                          textStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      18)),
                                                    ),
                                                  )),
                                                  DataColumn(
                                                      label: Expanded(
                                                    child: Text(
                                                      'Dead',
                                                      maxLines: 1,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.lato(
                                                          textStyle:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize:
                                                                      18)),
                                                    ),
                                                  )),
                                                ],
                                                rows: rowdata,
                                                columnSpacing: 20,
                                              ),
                                            ),
                                          )
=======
                                    DataTable(
                                      columns: [
                                        DataColumn(
                                            label: Text(
                                          'Date',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                              textStyle:
                                                  TextStyle(fontSize: 18)),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Confirmed',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.orange,
                                                  fontSize: 18)),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Recovered',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 18)),
                                        )),
                                        DataColumn(
                                            label: Text(
                                          'Dead',
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.lato(
                                              textStyle: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 18)),
                                        )),
                                      ],
                                      rows: rowdata,
                                      columnSpacing: 20,
                                    )
>>>>>>> 4f3af15 (Update)
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
