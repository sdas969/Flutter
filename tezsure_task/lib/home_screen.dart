import 'package:flutter/material.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'package:tezsure_task/all_token_heading.dart';
import 'package:tezsure_task/constants.dart';
import 'package:tezsure_task/overview_card.dart';
import 'package:tezsure_task/tezsure_store.dart';
import 'package:tezsure_task/token_tile.dart';
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
  List<Image> imageList = [
    Image.asset('assets/cards/bake.png'),
    Image.asset('assets/cards/buy.png'),
    Image.asset('assets/cards/discover.png')
  ];
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    TezSureStore store = VxState.store as TezSureStore;

    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.sync), onPressed: () {}),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            unselectedItemColor: Colors.white,
            selectedItemColor: buttonColor,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => setState(() => _index = index),
            items: bottomIconList),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            const OverviewCard(),
            Visibility(
              visible: visible,
              child: SwipeableCardsSection(
                context: context,
                items: imageList,
                onCardSwiped: (dir, index, widget) {
                  if (index == imageList.length - 1) {
                    if (mounted) {
                      setState(() => visible = false);
                    }
                  }
                },
                enableSwipeUp: false,
                enableSwipeDown: false,
              ),
            ),
            const AllTokenHeading(),
            Expanded(
              child: VxBuilder(
                mutations: const {SortH2L, SortL2H},
                builder: (context, _, __) => ListView.separated(
                    itemCount: store.tokenList.length,
                    separatorBuilder: (context, index) =>
                        const Divider(indent: 0, endIndent: 0, thickness: 2),
                    itemBuilder: (context, index) =>
                        TokenTile(store: store, index: index)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
