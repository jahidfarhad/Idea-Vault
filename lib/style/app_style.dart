import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {

  static Color bgColor = const Color(0xFFe2e2ff);
  static Color mainColor = const Color(0xFF000633);
  static Color accentColor = const Color(0xFF0065FF);
  static Color deleteColor = const Color(0xFFFF0000);

  // Setting colors for cards

  static List<Color> cardsColor = [

    Colors.white,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,

  ];

  // Setting the text style

  static TextStyle mainTitle = GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.bold);
  static TextStyle mainContent = GoogleFonts.nunito(fontSize: 16, fontWeight: FontWeight.normal);
  static TextStyle dateTitle = GoogleFonts.roboto(fontSize: 13, fontWeight: FontWeight.w500);

}

