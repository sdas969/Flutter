import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:task_1/login.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:flutter/material.dart';
import 'package:task_1/model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 10;
  List<Picsum> picsums = [];
  late ScrollController _scrollController;
  late RefreshController _refreshController;

  Future<bool> getData({bool isRefersh = false}) async {
    if (isRefersh) {
      picsums = [];
      currentPage = 10;
    }
    final Uri url =
        Uri.parse('https://picsum.photos/v2/list?page=$currentPage&limit=10');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var result = await compute(jsonDecode, response.body);
      for (var element in result) {
        picsums.add(Picsum.fromJson(element));
      }
      currentPage++;
      if (mounted) setState(() {});
      return true;
    }
    return false;
  }

  clearData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  void initState() {
    picsums = [];
    currentPage = 10;
    _refreshController = RefreshController(initialRefresh: true);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BluePad'),
          leading: IconButton(
              onPressed: () async {
                await clearData();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              icon: const Icon(Icons.logout)),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        ),
        body: SmartRefresher(
            enablePullUp: true,
            onRefresh: () async {
              final result = await getData(isRefersh: true);
              if (result) {
                _refreshController.refreshCompleted();
              } else {
                _refreshController.refreshFailed();
              }
            },
            onLoading: () async {
              final result = await getData();
              if (result) {
                _refreshController.loadComplete();
              } else {
                _refreshController.loadFailed();
              }
            },
            controller: _refreshController,
            child: CustomScrollView(
              cacheExtent: 10,
              controller: _scrollController,
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate(<Widget>[
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: MaterialButton(
                              disabledColor: Colors.purple,
                              disabledElevation: 10,
                              elevation: 10,
                              color: Colors.purple,
                              onPressed: null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 24, horizontal: 8),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: const [
                                    Text(
                                      'Username',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      'admin',
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Password',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Text(
                                      '1234',
                                      style: TextStyle(
                                          fontSize: 24, color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        ] +
                        List.generate(
                            picsums.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Material(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    elevation: 10,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: FadeInImage.assetNetwork(
                                          placeholder: '',
                                          placeholderErrorBuilder: (context,
                                                  url, downloadProgress) =>
                                              const Material(
                                                color: Colors.transparent,
                                                child: Padding(
                                                  padding: EdgeInsets.all(24),
                                                  child: Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  ),
                                                ),
                                              ),
                                          imageErrorBuilder: (context, url,
                                                  error) =>
                                              const Material(
                                                color: Colors.transparent,
                                                child: Padding(
                                                  padding: EdgeInsets.all(24.0),
                                                  child: Center(
                                                      child: Icon(Icons.error)),
                                                ),
                                              ),
                                          image: picsums[index].downloadUrl!),
                                    ),
                                  ),
                                ),
                            growable: true)))
              ],
            )));
  }
}
