import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sidebarx/sidebarx.dart';

final isDarkModeProvider = StateProvider<bool>((ref) {
  return true;
});

class AppTheme {
  static final ThemeData uniLightTheme = ThemeData(
    brightness: Brightness.light,
    sliderTheme: const SliderThemeData(
      trackHeight: 25.0,
      valueIndicatorTextStyle: TextStyle(
        color: Color.fromARGB(255, 41, 40, 41),
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
      ),
      valueIndicatorColor: Colors.grey,
    ),
    scaffoldBackgroundColor: Color.fromARGB(255, 176, 187, 189),
    primaryColor: Colors.green,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromARGB(255, 239, 237, 237),
      onPrimary: Color.fromARGB(255, 31, 30, 30),
      secondary: Color.fromARGB(255, 179, 192, 216),
      onSecondary: Color.fromARGB(255, 192, 186, 186),
      error: Color.fromARGB(255, 255, 0, 0),
      onError: Color.fromARGB(255, 255, 255, 255),
      background: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color.fromARGB(255, 255, 255, 255),
      surface: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromARGB(255, 255, 255, 255),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color.fromARGB(
        255,
        97,
        169,
        221,
      ),
      cursorColor: Colors.purple,
    ),
    //Color colorButtonAppBar = Colors.white
  );
  static final ThemeData uniDarkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color.fromARGB(255, 14, 19, 36),
    primaryColor: Colors.green,
    sliderTheme: const SliderThemeData(
      trackHeight: 25.0,
      valueIndicatorTextStyle: TextStyle(
        color: Color.fromARGB(255, 246, 243, 246),
        fontWeight: FontWeight.bold,
        fontSize: 15.0,
      ),
      valueIndicatorColor: Colors.grey,
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color.fromARGB(255, 62, 61, 61),
      onPrimary: Color.fromARGB(255, 255, 255, 255),
      secondary: Color.fromARGB(255, 78, 126, 209),
      onSecondary: Color.fromARGB(255, 94, 92, 92),
      error: Color.fromARGB(255, 220, 15, 15),
      onError: Color.fromARGB(255, 255, 255, 255),
      background: Color.fromARGB(255, 255, 255, 255),
      onBackground: Color.fromARGB(255, 255, 255, 255),
      surface: Color.fromARGB(255, 255, 255, 255),
      onSurface: Color.fromARGB(255, 255, 255, 255),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Color.fromARGB(
        255,
        97,
        169,
        221,
      ),
      cursorColor: Colors.purple,
    ),
    //Color colorButtonAppBar = Colors.white
  );
}

getThemeSideBar(BuildContext context) => SidebarXTheme(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      hoverColor: Theme.of(context).scaffoldBackgroundColor,
      hoverTextStyle: GoogleFonts.outfit(
        color: Theme.of(context).colorScheme.secondary,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      textStyle: GoogleFonts.outfit(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 25,
      ),
      selectedTextStyle: GoogleFonts.outfit(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 25,
      ),
      itemTextPadding: const EdgeInsets.only(left: 30),
      selectedItemTextPadding: const EdgeInsets.only(left: 30),
      itemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //border: Border.all(color: Colors.white),
      ),
      selectedItemDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 75, 76, 76),
            Theme.of(context).scaffoldBackgroundColor
          ],
        ),
      ),
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onPrimary,
        size: 20,
      ),
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onPrimary,
        size: 20,
      ),
    );

getExtendedTheme(BuildContext context) => SidebarXTheme(
      width: 280,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
