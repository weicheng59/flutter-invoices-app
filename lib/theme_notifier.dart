import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  double normalPadding = 24.0;
  double ratio = 1.0;
  late ThemeData _themeData;

  ThemeNotifier(Size screenSize) {
    _themeData = _lightThemeData;
    ratio = screenSize.width / 375;
    normalPadding = ratio * normalPadding;
  }

  final ThemeData _lightThemeData = ThemeData(
    fontFamily: 'Spartan',
    primaryColor: const Color.fromRGBO(124, 93, 250, 1),
    highlightColor: const Color.fromRGBO(146, 119, 255, 1),
    dividerColor: const Color.fromRGBO(73, 78, 110, 1),
    backgroundColor: const Color.fromRGBO(55, 59, 83, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(248, 248, 251, 1),
    canvasColor: const Color.fromRGBO(255, 255, 255, 1),
    splashColor: Colors.transparent,
    secondaryHeaderColor: const Color.fromRGBO(12, 14, 22, 1),
    cardColor: const Color.fromRGBO(249, 250, 254, 1),
    dialogBackgroundColor: const Color.fromRGBO(55, 59, 83, 1),
    selectedRowColor: const Color.fromRGBO(126, 136, 195, 1),
    indicatorColor: const Color.fromRGBO(126, 136, 195, 1),
    hintColor: const Color.fromRGBO(55, 59, 83, 1),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 12,
        height: 1.25,
        color: Color.fromRGBO(133, 139, 178, 1),
      ),
      bodyLarge: TextStyle(
        fontSize: 12,
        height: 1.25,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(12, 14, 22, 1),
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        height: 1.6,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(12, 14, 22, 1),
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        height: 1.5,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(12, 14, 22, 1),
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        height: 1.33,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(12, 14, 22, 1),
      ),
    ),
  );

  final ThemeData _darkThemeData = ThemeData(
    fontFamily: 'Spartan',
    primaryColor: const Color.fromRGBO(124, 93, 250, 1),
    highlightColor: const Color.fromRGBO(146, 119, 255, 1),
    dividerColor: const Color.fromRGBO(73, 78, 110, 1),
    backgroundColor: const Color.fromRGBO(30, 33, 57, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(20, 22, 37, 1),
    splashColor: Colors.transparent,
    canvasColor: const Color.fromRGBO(30, 33, 57, 1),
    secondaryHeaderColor: const Color.fromRGBO(255, 255, 255, 1),
    cardColor: const Color.fromRGBO(37, 41, 69, 1),
    dialogBackgroundColor: const Color.fromRGBO(12, 14, 22, 1),
    selectedRowColor: const Color.fromRGBO(30, 33, 57, 1),
    indicatorColor: const Color.fromRGBO(223, 227, 250, 1),
    hintColor: const Color.fromRGBO(223, 227, 250, 1),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 12,
        height: 1.25,
        color: Color.fromRGBO(223, 227, 250, 1),
      ),
      bodyLarge: TextStyle(
        fontSize: 12,
        height: 1.25,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        height: 1.6,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        height: 1.5,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        height: 1.33,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    ),
  );

  ThemeData get theme => _themeData;
  bool isDarkMode = false;

  changeTheme() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      _themeData = _darkThemeData;
    } else {
      _themeData = _lightThemeData;
    }
    notifyListeners();
  }
}

const double opacity = 0.06;
const double textPadding = 4.0;
const double textBoldPadding = 12;
const double textBlockPadding = 30;

Color textPurpleColor = const Color.fromRGBO(126, 136, 195, 1);
Color myWhite = const Color.fromRGBO(255, 255, 255, 1);
