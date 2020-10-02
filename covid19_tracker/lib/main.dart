import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'citySelect.dart';
import 'aboutPage.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'corona_icons.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
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
              textStyle: TextStyle(fontSize: 30, color: Colors.white70)),
        ),
        backgroundColor: ThemeData.dark().primaryColor,
        styleTextUnderTheLoader: TextStyle(),
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
  double maxY = 0;
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
      maxY = 0;
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
    var temp = await http.get('https://disease.sh/v3/covid-19/jhucsse');
    var temphist = await http.get(
        'https://disease.sh/v3/covid-19/historical/$countrytemp?lastdays=14');
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
        maxY = double.parse(jsonResHist['timeline']['cases'][i].toString());
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

  @override
  void initState() {
    super.initState();
    textBody('India', 'Delhi');
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
          bottomNavigationBar: TabBar(tabs: [
            Tab(icon: Icon(Corona.virus)),
            Tab(
                icon: Icon(
              Icons.info,
            ))
          ]),
          body: TabBarView(
            children: [
              Scaffold(
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
                            IconButton(
                                enableFeedback: true,
                                icon: Hero(
                                    tag: 'search',
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.white,
                                    )),
                                onPressed: () async {
                                  final countrystate = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CitySelect()));
                                  countrystate == null
                                      ? textBody(selcountry,
                                          selstate == '' ? null : selstate)
                                      : textBody(
                                          countrystate[0], countrystate[1]);
                                })
                          ],
                          expandedHeight: 100,
                          centerTitle: true,
                          flexibleSpace: FlexibleSpaceBar(
                            title: Text('Corona Tracker'),
                            stretchModes: [StretchMode.fadeTitle],
                          ),
                          stretch: true,
                        ),
                        SliverList(
                            delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Center(child: Text('Updated on $updated')),
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
                                      subtitle: Text(selcountry),
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
                                                color: Colors.white70)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(40),
                                      child: LineChart(
                                        LineChartData(
                                            gridData: FlGridData(
                                              show: true,
                                              drawVerticalLine: true,
                                              drawHorizontalLine: true,
                                              getDrawingHorizontalLine:
                                                  (value) {
                                                return FlLine(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    strokeWidth: 1);
                                              },
                                              getDrawingVerticalLine: (value) {
                                                return FlLine(
                                                  color: Colors.grey
                                                      .withOpacity(0.2),
                                                  strokeWidth: 1,
                                                );
                                              },
                                            ),
                                            borderData: FlBorderData(
                                                show: true,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 1)),
                                            minX: 0,
                                            minY: 0,
                                            maxX: 13,
                                            maxY: (maxY * 1.1),
                                            lineBarsData: [
                                              LineChartBarData(
                                                  colors: [Colors.orangeAccent],
                                                  spots: cases,
                                                  isCurved: true,
                                                  barWidth: 5,
                                                  isStrokeCapRound: true,
                                                  belowBarData: BarAreaData(
                                                      show: true,
                                                      colors: [
                                                        Colors.orange
                                                            .withOpacity(0.2)
                                                      ])),
                                              LineChartBarData(
                                                  colors: [Colors.greenAccent],
                                                  spots: recovered,
                                                  isCurved: true,
                                                  barWidth: 5,
                                                  isStrokeCapRound: true,
                                                  belowBarData: BarAreaData(
                                                      show: true,
                                                      colors: [
                                                        Colors.green
                                                            .withOpacity(0.2)
                                                      ])),
                                              LineChartBarData(
                                                  colors: [Colors.redAccent],
                                                  spots: deaths,
                                                  isCurved: true,
                                                  barWidth: 5,
                                                  isStrokeCapRound: true,
                                                  belowBarData: BarAreaData(
                                                      show: true,
                                                      colors: [
                                                        Colors.red
                                                            .withOpacity(0.2)
                                                      ]))
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
                                                          color: Colors.white70,
                                                          fontSize: 10))),
                                              leftTitles: SideTitles(
                                                interval: maxY == 0
                                                    ? double.infinity
                                                    : (maxY * 1.1 / 10) - 1,
                                                reservedSize: 15,
                                                showTitles: true,
                                                getTitles: (value) {
                                                  if ((value ~/ 100000000) >= 1)
                                                    return '${value.toString().substring(0, 3)}M';
                                                  else if ((value ~/
                                                          10000000) >=
                                                      1)
                                                    return '${value.toString().substring(0, 2)}M';
                                                  else if ((value ~/ 1000000) >=
                                                      1)
                                                    return '${(value / 1000000).toStringAsFixed(2)}M';
                                                  else if ((value ~/ 100000) >=
                                                      1)
                                                    return '${value.toString().substring(0, 3)}K';
                                                  else if ((value ~/ 10000) >=
                                                      1)
                                                    return '${value.toString().substring(0, 2)}K';
                                                  else if ((value ~/ 1000) >= 1)
                                                    return '${(value / 1000).toStringAsFixed(2)}K';
                                                  else
                                                    return (value ~/ 1)
                                                        .toString();
                                                },
                                                textStyle: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                        color: Colors.white70,
                                                        fontSize: 10)),
                                                margin: 20,
                                              ),
                                            )),
                                        swapAnimationDuration:
                                            Duration(milliseconds: 2),
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
                                                color: Colors.white70)),
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
              ),
              AboutPage()
            ],
          ),
        ),
      ),
    );
  }
}
