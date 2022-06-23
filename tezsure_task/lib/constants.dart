import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String appTitle = 'TezSure';

ThemeData appThemeData = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme()
        .apply(bodyColor: primaryColor, displayColor: primaryColor));

Color buttonColor = const Color(0xffF8DF00);
Color backgroundColor = Colors.black;
Color secondaryBackgroundColor = const Color(0xff252525);
Color secondaryColor = Colors.black;
Color primaryColor = Colors.white;
Color cardBorderColor = const Color(0xffB8B8B8);

AssetImage profileImage = const AssetImage('assets/profile/profile.png');

String accountName = 'Jon Ben';

double portfolioBalance = 46.78;

List<BottomNavigationBarItem> bottomIconList = const [
  BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Wallet'),
  BottomNavigationBarItem(icon: Icon(Icons.photo_library), label: 'Gallery'),
  BottomNavigationBarItem(icon: Icon(Icons.star_outline), label: 'Favorite'),
  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
];

List<Image> imageList = [
  Image.asset('assets/cards/buy.png'),
  Image.asset('assets/cards/discover.png'),
  Image.asset('assets/cards/bake.png')
];

List<String> sortByOptions = ['Price : Low to High', 'Price : High to Low'];
