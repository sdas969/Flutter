import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class DiscussScreen extends StatefulWidget {
  AdvancedDrawerController controller;
  DiscussScreen({required this.controller});
  @override
  _DiscussScreenState createState() => _DiscussScreenState();
}

class _DiscussScreenState extends State<DiscussScreen> {
  bool collapsed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 20,
              forceElevated: true,
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sort))],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              leading: IconButton(
                  onPressed: () {
                    widget.controller.toggleDrawer();
                  },
                  icon: Icon(Icons.menu)),
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.blurBackground,
                    StretchMode.fadeTitle
                  ],
                  centerTitle: true,
                  title: Text("Discuss",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      )),
                  background: Icon(
                    Icons.chat,
                    size: 80,
                  )),
            ),
          ];
        },
        body: ListView(
          padding: EdgeInsets.all(11),
          children: [
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
            CustomWidget(),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //         onPressed: () {
    //           widget.controller.toggleDrawer();
    //         },
    //         icon: Icon(Icons.menu)),
    //     title: Text('Discuss'),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () {},
    //     child: Icon(Icons.add),
    //   ),
    //   floatingActionButtonLocation:
    //       FloatingActionButtonLocation.miniCenterFloat,
    //   extendBodyBehindAppBar: false,
    //   extendBody: true,
    //   body: SafeArea(
    //     child: Center(
    // child: ListView(
    //   padding: EdgeInsets.all(11),
    //   children: [
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //     CustomWidget(),
    //   ],
    // ),
    //     ),
    //   ),
    // );
  }
}

class CustomWidget extends StatelessWidget {
  const CustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExpansionTile(
          collapsedBackgroundColor: Colors.blueGrey[100],
          backgroundColor: Colors.blueGrey,
          tilePadding: EdgeInsets.all(10),
          textColor: Colors.white,
          leading: CircleAvatar(
            child: Icon(Icons.person),
            backgroundColor: Colors.black,
          ),
          subtitle: Text('By ' + 'Hello'),
          title: Text('Problem Title'),
          collapsedIconColor: Colors.black,
          iconColor: Colors.white,
          childrenPadding: EdgeInsets.all(11),
          maintainState: true,
          children: [
            Text(
              'Problcsdcscsdjkcbsjbcdhjscbhjsdjvhdsbvsdbxem vxvxvxcv xv xcvxcvxcD escriptionjzdvdsbd jhbsdbdsjhbdjvdjhvdjdsvjdsvbjsdvjshdvsdjhvbjsdvjsdvjsvjsdvsjdhv',
              style: TextStyle(color: Colors.white),
            ),
            DiscussButtonBar()
          ],
        ),
      ),
    );
  }
}

class DiscussButtonBar extends StatelessWidget {
  const DiscussButtonBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ChatUpvoteSeen(), Share()],
    );
  }
}

class Share extends StatelessWidget {
  const Share({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.share,
        color: Colors.white,
      ),
      onPressed: () {},
    );
  }
}

class ChatUpvoteSeen extends StatelessWidget {
  const ChatUpvoteSeen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.question_answer,
              color: Colors.white,
            ),
            label: Text(
              '2',
              style: TextStyle(color: Colors.white),
            )),
        TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.thumb_up,
              color: Colors.white,
            ),
            label: Text(
              '2',
              style: TextStyle(color: Colors.white),
            )),
        TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.remove_red_eye,
              color: Colors.white,
            ),
            label: Text(
              '2',
              style: TextStyle(color: Colors.white),
            )),
      ],
    );
  }
}
