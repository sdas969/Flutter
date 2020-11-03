import 'package:flutter/material.dart';
import 'package:tv_app/video.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 150,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50))),
            expandedHeight: 250,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                child: Image.network(
                  'https://images.freekaamaal.com/post_images/1591185056.jpg',
                  fit: BoxFit.cover,
                ),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 40, 0, 20),
                    child: Text(
                      'Dark (2017)',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8.0),
                            child: Text('Adventure',
                                style: TextStyle(color: Colors.grey)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Thriller',
                                style: TextStyle(color: Colors.grey)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Mystery',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Sci-Fi',
                                style: TextStyle(color: Colors.grey)),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 0, 40),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 60,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 60,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 60,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 60,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow.withOpacity(0.5),
                          size: 60,
                        )
                      ],
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Videoplay(),
                          ));
                    },
                    leading: Image.network(
                        'https://images.freekaamaal.com/post_images/1591185056.jpg'),
                    trailing: IconButton(
                      icon: Icon(Icons.download_rounded),
                      onPressed: () {},
                    ),
                    title: Text('1. Cave Secret'),
                    subtitle: Text('45 minutes'),
                  ),
                  ListTile(
                    leading: Image.network(
                        'https://images.freekaamaal.com/post_images/1591185056.jpg'),
                    trailing: IconButton(
                      icon: Icon(Icons.download_rounded),
                      onPressed: () {},
                    ),
                    title: Text('2. Lies'),
                    subtitle: Text('45 minutes'),
                  ),
                  ListTile(
                    leading: Image.network(
                        'https://images.freekaamaal.com/post_images/1591185056.jpg'),
                    trailing: IconButton(
                      icon: Icon(Icons.download_rounded),
                      onPressed: () {},
                    ),
                    title: Text('3. Pastand Present'),
                    subtitle: Text('45 minutes'),
                  ),
                  ListTile(
                    leading: Image.network(
                        'https://images.freekaamaal.com/post_images/1591185056.jpg'),
                    trailing: IconButton(
                      icon: Icon(Icons.download_rounded),
                      onPressed: () {},
                    ),
                    title: Text('4. Double Lives'),
                    subtitle: Text('45 minutes'),
                  ),
                  ListTile(
                    leading: Image.network(
                        'https://images.freekaamaal.com/post_images/1591185056.jpg'),
                    trailing: IconButton(
                      icon: Icon(Icons.download_rounded),
                      onPressed: () {},
                    ),
                    title: Text('5. Truths'),
                    subtitle: Text('45 minutes'),
                  ),
                  ListTile(
                    leading: Image.network(
                        'https://images.freekaamaal.com/post_images/1591185056.jpg'),
                    trailing: IconButton(
                      icon: Icon(Icons.download_rounded),
                      onPressed: () {},
                    ),
                    title: Text('6. Crossroads'),
                    subtitle: Text('45 minutes'),
                  ),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
