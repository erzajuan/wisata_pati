import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConstStyle {
  static heightOfDevice(context) => MediaQuery.of(context).size.height;
  static widthOfDevice(context) => MediaQuery.of(context).size.width;

  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Color(0xff8c8c8c);
  static MaterialColor darkGreySwatch =
      MaterialColor(primaryColor.value, <int, Color>{
    50: primaryColor,
    100: Colors.blueGrey[100]!,
    200: Colors.blueGrey[200]!,
    300: Colors.blueGrey[300]!,
    400: Colors.blueGrey[400]!,
    500: Colors.blueGrey[500]!,
    600: Colors.blueGrey[600]!,
    700: Colors.blueGrey[800]!,
    800: Colors.blueGrey[900]!,
    900: Colors.blueGrey[700]!,
  });

  static MaterialColor blackSwatch = MaterialColor(Colors.black.value, const <int, Color>{
    50: Colors.black,
    100: Colors.black12,
    200: Colors.black26,
    300: Colors.black38,
    400: Colors.black45,
    500: Colors.black54,
    600: Colors.black87,
    700: Colors.black54,
    800: Colors.black87,
    900: Colors.black,
  });

  static TextStyle whiteTextStyle({FontWeight? fontWeight, double? fontSize}) =>
      GoogleFonts.workSans(
          color: Colors.white, fontWeight: fontWeight, fontSize: fontSize);
  static TextStyle blackTextStyle({FontWeight? fontWeight, double? fontSize}) =>
      GoogleFonts.workSans(
          color: const Color(0xff3C3C3C),
          fontWeight: fontWeight,
          fontSize: fontSize);
}
