import 'package:flutter/material.dart';
import 'package:tezsure_task/constants.dart';
import 'package:tezsure_task/store/tezsure_store.dart';
import 'package:tezsure_task/ui/overview_card.dart';
import 'package:tezsure_task/ui/token_list.dart';
import 'package:tezsure_task/utilities/custom_header.dart';
import 'package:tezsure_task/utilities/transfer_icon.dart';
import 'package:velocity_x/velocity_x.dart';

class Token {
  const Token(
      {required this.codename,
      required this.imagePath,
      required this.name,
      required this.shares,
      required this.value});
  final String imagePath;
  final String name;
  final String codename;
  final double shares;
  final double value;
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  bool visible = true;
  late ScrollController _scrollController;
  late TezSureStore store;

  @override
  void initState() {
    _scrollController = ScrollController();
    store = VxState.store as TezSureStore;
    SortL2H();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  handleDismissed(index) {
    imageList.removeLast();
    if (imageList.isEmpty) {
      setState(() {
        visible = false;
      });
    }
  }

  handleTabChange(index) => setState(() => _index = index);

  @override
  Widget build(BuildContext context) {
    SliverToBoxAdapter cardStack = SliverToBoxAdapter(
        child: Visibility(
            visible: visible,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: imageList
                        .mapIndexed((image, index) => Dismissible(
                              key: Key('$image'),
                              onDismissed: handleDismissed,
                              child: image,
                            ))
                        .toList()))));

    BottomNavigationBar bottomNavBar = BottomNavigationBar(
        currentIndex: _index,
        unselectedItemColor: Colors.white,
        selectedItemColor: buttonColor,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: handleTabChange,
        items: bottomIconList);

    return SafeArea(
        child: Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
                backgroundColor: buttonColor,
                child: const TransferIcon(),
                onPressed: () {}),
            bottomNavigationBar: bottomNavBar,
            backgroundColor: backgroundColor,
            body: CustomScrollView(controller: _scrollController, slivers: [
              const SliverAppBar(
                  expandedHeight: 250.0,
                  flexibleSpace: FlexibleSpaceBar(background: OverviewCard())),
              cardStack,
              SliverPersistentHeader(delegate: CustomHeader(), pinned: true),
              TokenList(store: store)
            ])));
  }
}
