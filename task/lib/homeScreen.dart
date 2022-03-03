import 'package:flutter/material.dart';
import 'package:task/calendar.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class Habit {
  final String text;
  final Color color;
  bool isCompleted;
  Habit(this.color, this.text, this.isCompleted);
}

class Game {
  final String text;
  Game(this.text);
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late List<Habit> habits;
  late List<Game> games;
  late ScrollController _scrollController;
  late TabController _tabController;
  late final AnimationController _animationController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
    _animationController = AnimationController(vsync: this);
    habits = [
      Habit(Colors.red, 'Yoga', true),
      Habit(Colors.blue, 'Gym', true),
      Habit(Colors.purple, 'Meditation', false),
      Habit(Colors.blue.shade900, 'Coding', true),
      Habit(Colors.orange, 'Walking', true),
      Habit(Colors.pinkAccent, 'Hydrate', false)
    ];
    games = [
      Game('Daily Challenge'),
      Game('52 / 7'),
      Game('HabitUp T-Shirt Challenge')
    ];
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    _animationController.dispose();
  }

  int countPending(habits) {
    int count = 0;
    for (int i = 0; i < habits.length; i++) {
      if (!habits[i].isCompleted) count++;
    }
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: TabBar(
          indicatorPadding: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.blue.shade700),
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.games),
            )
          ]),
      body: TabBarView(
        controller: _tabController,
        children: [
          CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  pinned: true,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const Calendar())));
                      },
                      icon: const Icon(Icons.calendar_month)),
                  actions: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  ],
                  forceElevated: true,
                  floating: true,
                  stretch: true,
                  elevation: 10,
                  expandedHeight: 350,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle
                    ],
                    titlePadding: const EdgeInsets.all(2),
                    centerTitle: true,
                    title: const Image(image: AssetImage('images/logo.png')),
                    background: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Hi, Smarajit',
                                style: TextStyle(fontSize: 30),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                countPending(habits) > 0
                                    ? 'You have ${countPending(habits)} pending habits for today'
                                    : 'You' 're done for today!!',
                                style: const TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: Lottie.asset('lottie/hello.json',
                                repeat: true)),
                      ],
                    ),
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 100,
                          child: ListView.builder(
                            itemCount: 31 - DateTime.now().day,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, f) {
                              int day = DateTime.now().day + f;
                              return FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    height: 90,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    color: day == DateTime.now().day
                                        ? const Color(0xff727be8)
                                        : Colors.white,
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${DateTime.now().day + f}",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight:
                                                day == DateTime.now().day
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                            color: day == DateTime.now().day
                                                ? Colors.white
                                                : Colors.grey[500],
                                          ),
                                        ),
                                        Text(
                                          DateFormat('EE').format(
                                            DateTime.now().add(
                                              Duration(days: f),
                                            ),
                                          ),
                                          style: TextStyle(
                                              color: day == DateTime.now().day
                                                  ? Colors.white
                                                  : Colors.grey[700],
                                              fontWeight:
                                                  day == DateTime.now().day
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Habits',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Column(
                          children: habits
                              .map((habit) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                        leading: Container(
                                          color: habit.color,
                                          width: 2,
                                          height: double.infinity,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            habit.isCompleted =
                                                !habit.isCompleted;
                                          });
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(11)),
                                        title: Text(habit.text),
                                        trailing: Icon(
                                          habit.isCompleted
                                              ? Icons.check_circle
                                              : Icons.circle_outlined,
                                          size: 30,
                                          color: habit.isCompleted
                                              ? Colors.green
                                              : Colors.grey,
                                        )),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  )
                ]))
              ]),
          CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  forceElevated: true,
                  floating: true,
                  stretch: true,
                  elevation: 10,
                  expandedHeight: 350,
                  flexibleSpace: FlexibleSpaceBar(
                    stretchModes: const [
                      StretchMode.blurBackground,
                      StretchMode.fadeTitle
                    ],
                    titlePadding: const EdgeInsets.all(2),
                    centerTitle: true,
                    background:
                        Lottie.asset('lottie/gamification.json', repeat: false),
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          height: 100,
                          child: ListView.builder(
                            itemCount: 31 - DateTime.now().day,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, f) {
                              int day = DateTime.now().day + f;
                              return FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: MaterialButton(
                                    onPressed: () {},
                                    height: 90,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    color: day == DateTime.now().day
                                        ? const Color(0xff727be8)
                                        : Colors.white,
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "${DateTime.now().day + f}",
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight:
                                                day == DateTime.now().day
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                            color: day == DateTime.now().day
                                                ? Colors.white
                                                : Colors.grey[500],
                                          ),
                                        ),
                                        Text(
                                          DateFormat('EE').format(
                                            DateTime.now().add(
                                              Duration(days: f),
                                            ),
                                          ),
                                          style: TextStyle(
                                              color: day == DateTime.now().day
                                                  ? Colors.white
                                                  : Colors.grey[700],
                                              fontWeight:
                                                  day == DateTime.now().day
                                                      ? FontWeight.bold
                                                      : FontWeight.normal),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Challenges',
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        Column(
                          children: games
                              .map((game) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                        onTap: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(11)),
                                        title: Text(game.text),
                                        trailing: const Icon(
                                            Icons.keyboard_arrow_right)),
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  )
                ]))
              ])
        ],
      ),
    );
  }
}
