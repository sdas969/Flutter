import 'dart:ui';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'subscription.dart';

class Paged extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Paged> {
  List<bool> isSelectedop = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> isSelectedcw = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> isSelectedtn = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];
  List<bool> isSelectedtrn = [
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                title: Text('Smarajit Das'),
                subtitle: Text('Basic Subscription'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars2.githubusercontent.com/u/60264722?s=460&u=4a05c7a35dbc74834c29647e84b39df018facdde&v=4'),
                  radius: 20,
                ),
                trailing: RaisedButton(
                  child: Text('Upgrade'),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Subscription(),
                        ));
                  },
                ),
              ),
              Container(
                height: 110,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.search,
                                  size: 40,
                                  color: isSelectedop[0]
                                      ? Colors.white
                                      : Color(0xff903dff),
                                )),
                            Expanded(
                                child: Text(
                              'Search',
                              style: TextStyle(
                                  color: isSelectedop[0]
                                      ? Colors.white
                                      : Color(0xff903dff)),
                            ))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            bool temp = !isSelectedop[0];
                            isSelectedop.fillRange(0, 6, false);
                            isSelectedop[0] = temp;
                            print(isSelectedop);
                          });
                        },
                        color:
                            isSelectedop[0] ? Color(0xff903dff) : Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.tv,
                                  size: 40,
                                  color: isSelectedop[1]
                                      ? Colors.white
                                      : Color(0xff903dff),
                                )),
                            Expanded(
                                child: Text(
                              'TV Shows',
                              style: TextStyle(
                                  color: isSelectedop[1]
                                      ? Colors.white
                                      : Color(0xff903dff)),
                            ))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            bool temp = !isSelectedop[1];
                            isSelectedop.fillRange(0, 6, false);
                            isSelectedop[1] = temp;
                            print(isSelectedop);
                          });
                        },
                        color:
                            isSelectedop[1] ? Color(0xff903dff) : Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.movie,
                                  size: 40,
                                  color: isSelectedop[2]
                                      ? Colors.white
                                      : Color(0xff903dff),
                                )),
                            Expanded(
                                child: Text(
                              'Movies',
                              style: TextStyle(
                                  color: isSelectedop[2]
                                      ? Colors.white
                                      : Color(0xff903dff)),
                            ))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            bool temp = !isSelectedop[2];
                            isSelectedop.fillRange(0, 6, false);
                            isSelectedop[2] = temp;
                            print(isSelectedop);
                          });
                        },
                        color:
                            isSelectedop[2] ? Color(0xff903dff) : Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.sports_football,
                                  size: 40,
                                  color: isSelectedop[3]
                                      ? Colors.white
                                      : Color(0xff903dff),
                                )),
                            Expanded(
                                child: Text(
                              'Sports',
                              style: TextStyle(
                                  color: isSelectedop[3]
                                      ? Colors.white
                                      : Color(0xff903dff)),
                            ))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            bool temp = !isSelectedop[3];
                            isSelectedop.fillRange(0, 6, false);
                            isSelectedop[3] = temp;
                            print(isSelectedop);
                          });
                        },
                        color:
                            isSelectedop[3] ? Color(0xff903dff) : Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.search,
                                  size: 40,
                                  color: isSelectedop[4]
                                      ? Colors.white
                                      : Color(0xff903dff),
                                )),
                            Expanded(
                                child: Text(
                              'Search',
                              style: TextStyle(
                                  color: isSelectedop[4]
                                      ? Colors.white
                                      : Color(0xff903dff)),
                            ))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            bool temp = !isSelectedop[4];
                            isSelectedop.fillRange(0, 6, false);
                            isSelectedop[4] = temp;
                            print(isSelectedop);
                          });
                        },
                        color:
                            isSelectedop[4] ? Color(0xff903dff) : Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.search,
                                  size: 40,
                                  color: isSelectedop[5]
                                      ? Colors.white
                                      : Color(0xff903dff),
                                )),
                            Expanded(
                                child: Text(
                              'Search',
                              style: TextStyle(
                                  color: isSelectedop[5]
                                      ? Colors.white
                                      : Color(0xff903dff)),
                            ))
                          ],
                        ),
                        onPressed: () {
                          setState(() {
                            bool temp = !isSelectedop[5];
                            isSelectedop.fillRange(0, 6, false);
                            isSelectedop[5] = temp;
                            print(isSelectedop);
                          });
                        },
                        color:
                            isSelectedop[5] ? Color(0xff903dff) : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Text(
                  'Continue Watching',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://terrigen-cdn-dev.marvel.com/content/prod/1x/avengersendgame_lob_crd_05.jpg'),
                        onPressed: () {
                          AssetsAudioPlayer.newPlayer().open(
                            Audio("assets/1.mp3"),
                            showNotification: true,
                          );
                        },
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/en/4/4d/Avengers_Infinity_War_poster.jpg'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/I/81mHrZwpn7L._SL1500_.jpg'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://images-na.ssl-images-amazon.com/images/I/91lHdPt5YML._AC_SY741_.jpg'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://m.media-amazon.com/images/M/MV5BOGE4NzU1YTAtNzA3Mi00ZTA2LTg2YmYtMDJmMThiMjlkYjg2XkEyXkFqcGdeQXVyNTgzMDMzMTg@._V1_.jpg'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/en/8/8a/The_Avengers_%282012_film%29_poster.jpg'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Text(
                  'Top Now',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://www.vitalthrills.com/wp-content/uploads/2019/09/irishmanheader.jpg'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://cdn.vox-cdn.com/thumbor/hj7W-ANr7xp11U0mGNAnvpMuTzU=/0x0:810x1200/1200x800/filters:focal(337x847:465x975)/cdn.vox-cdn.com/uploads/chorus_image/image/55660157/strangerthings.0.jpg'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://wallpaperaccess.com/full/2703652.png'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Icon(
                                    Icons.search,
                                    size: 40,
                                  )),
                              Expanded(child: Text('Search'))
                            ],
                          ),
                        ),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Icon(
                                    Icons.search,
                                    size: 40,
                                  )),
                              Expanded(child: Text('Search'))
                            ],
                          ),
                        ),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Icon(
                                    Icons.search,
                                    size: 40,
                                  )),
                              Expanded(child: Text('Search'))
                            ],
                          ),
                        ),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Text(
                  'Trending Now',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                          'https://assetscdn1.paytm.com/images/catalog/product/H/HO/HOMBIG-BANG-THEHK-P630247D60B33F4/1563111551192_0..jpg',
                          fit: BoxFit.fill,
                        ),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://realrecipe.net/wp-content/uploads/2020/03/Coffee-And-Kareem-Trailer.jpg'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.network(
                            'https://static.abplive.com/wp-content/uploads/sites/2/2020/10/27225423/Scam-1992.jpg?impolicy=abp_cdn&imwidth=1200&imheight=628'),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Icon(
                                    Icons.search,
                                    size: 40,
                                  )),
                              Expanded(child: Text('Search'))
                            ],
                          ),
                        ),
                        onPressed: () {},
                        color: Color(0xff903dff),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
