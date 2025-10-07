import 'package:pgold/config/enumefy.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/session_util.dart';
import 'palletefy.dart';

class Themefy extends Palletefy {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
          seedColor: Palletefy().primaryColor(ThemeModeType.lightMode)),
      fontFamily: GoogleFonts.leagueSpartan().fontFamily,
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: GoogleFonts.leagueSpartan().fontFamily,
            bodyColor: Palletefy().textColor(ThemeModeType.lightMode),
          ),
      visualDensity: VisualDensity.adaptivePlatformDensity,

      iconTheme:
          IconThemeData(color: Palletefy().iconColor(ThemeModeType.lightMode)),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          //MML
          // shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          //   RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(5), // Set border radius
          //   ),
          //),
          backgroundColor: WidgetStateProperty.all(
            Palletefy().buttonColor(ThemeModeType.lightMode),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          //MML
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Set border radius
          ),
          foregroundColor: Palletefy().buttonColor(ThemeModeType.lightMode),
          side: BorderSide(
              width: 1.0,
              color: Palletefy().buttonColor(ThemeModeType.lightMode)),
        ),
      ),

      appBarTheme: AppBarTheme(
          backgroundColor: Palletefy().appBarColor(ThemeModeType.lightMode)),
      // scaffoldBackgroundColor: Palletefy()
      //     .scaffoldColor(ThemeModeType.lightMode), //coColors.grey[100], nst

      inputDecorationTheme: InputDecorationTheme(
        //isDense: true,
        fillColor: Palletefy().textFieldFillColor(ThemeModeType.lightMode),
        filled: true,
        errorMaxLines: 3,
        labelStyle: const TextStyle(fontSize: 15),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Palletefy().textFieldBorderColor(ThemeModeType.lightMode),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        errorStyle: TextStyle(
          color: Palletefy().errorColor(ThemeModeType.lightMode),
          overflow: TextOverflow.ellipsis,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Palletefy().textFieldBorderColor(ThemeModeType.lightMode),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Palletefy().textFieldBorderColor(ThemeModeType.lightMode),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30.0),
          ),
        ),
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: GoogleFonts.sora().fontFamily,
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: GoogleFonts.sora().fontFamily,
            bodyColor: Palletefy().textColor(ThemeModeType.darkMode),
          ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Palletefy().primaryColor(ThemeModeType.darkMode)),
      iconTheme:
          IconThemeData(color: Palletefy().iconColor(ThemeModeType.darkMode)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          //MMD
          // shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          //   RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(5), // Set border radius
          //   ),
          // ),
          backgroundColor: WidgetStateProperty.all(
              Palletefy().buttonColor(ThemeModeType.darkMode)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          //MMD
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), // Set border radius
          ),
          foregroundColor: Palletefy().buttonColor(ThemeModeType.darkMode),
          side: BorderSide(
              width: 1.0,
              color: Palletefy().buttonColor(ThemeModeType.darkMode)),
        ),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: Palletefy().appBarColor(ThemeModeType.darkMode)),
      inputDecorationTheme: InputDecorationTheme(
        //isDense: true,
        errorMaxLines: 3,
        fillColor: Palletefy().textFieldFillColor(ThemeModeType.darkMode),
        filled: true,
        labelStyle: TextStyle(
            fontSize: 15, color: Palletefy().textColor(ThemeModeType.darkMode)),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Palletefy().textFieldBorderColor(ThemeModeType.darkMode),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        errorStyle: TextStyle(
            color: Palletefy().errorColor(ThemeModeType.darkMode),
            overflow: TextOverflow.ellipsis),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Palletefy().textFieldBorderColor(ThemeModeType.darkMode),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Palletefy().textFieldBorderColor(ThemeModeType.darkMode),
            width: 1.0,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }

  static ThemeMode themeMode(BuildContext context) {
    final isDarkMode = SessionUtil().read('isDarkMode') ?? false;
    return isDarkMode == true ? ThemeMode.dark : ThemeMode.light;
  }
}
