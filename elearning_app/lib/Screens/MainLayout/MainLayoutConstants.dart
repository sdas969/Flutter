import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

final List<GButton> bottomTabs = [
  GButton(
    icon: Icons.home,
    text: 'Home',
  ),
  GButton(
    icon: Icons.chat,
    text: 'Discuss',
  ),
  GButton(
    icon: Icons.book,
    text: 'Study Zone',
  ),
  GButton(
    icon: Icons.person,
    text: 'Profile',
  ),
];
var drawerElements = [
  Container(
    width: 128.0,
    height: 128.0,
    margin: const EdgeInsets.only(
      top: 24.0,
      bottom: 64.0,
    ),
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
      color: Colors.black26,
      shape: BoxShape.circle,
    ),
    child: Icon(Icons.person),
  ),
  ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    onTap: () {},
    leading: Icon(Icons.info),
    title: Text('About Us'),
  ),
  Divider(
    color: Colors.white54,
  ),
  ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    onTap: () {},
    leading: Icon(Icons.rate_review),
    title: Text('Rate the App'),
  ),
  Divider(
    color: Colors.white54,
  ),
  ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    onTap: () {},
    leading: Icon(Icons.logout),
    title: Text('Logout'),
  ),
  Divider(
    color: Colors.white54,
  ),
  ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
    onTap: () {},
    leading: Icon(Icons.settings),
    title: Text('Settings'),
  ),
  ListTile(
    title: DefaultTextStyle(
      style: TextStyle(
        fontSize: 12,
        color: Colors.white54,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Terms of Service',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
              VerticalDivider(
                color: Colors.white54,
                endIndent: 0,
                indent: 0,
                width: 1,
              ),
              Expanded(
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ],
          ),
        ),
      ),
    ),
  ),
];
const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    boxShadow: [
      BoxShadow(color: Colors.grey[800]!, spreadRadius: 5, blurRadius: 20)
    ]);
final AdvancedDrawerController advancedDrawerController =
    AdvancedDrawerController();
