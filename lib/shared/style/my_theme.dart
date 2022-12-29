import 'package:flutter/material.dart';

class MyTheme {
  static Color lightPryColor = Color(0xFF5D9CEC);
  static Color lightGreen = Color(0xFFDFECDB);
  static Color redColor = Color(0xFFEC4B4B);
  static Color greenColor = Color(0xFF61E757);
  static Color darkPryColor = Color(0xFF141A2E);

  static final ThemeData lightTheme = ThemeData(
      primaryColor: lightPryColor,
      colorScheme: ColorScheme(
          brightness:Brightness.light ,
          primary: lightPryColor,
          onPrimary: Colors.white,
          secondary: lightGreen,
          onSecondary: Colors.white,
          error: redColor,
          onError: redColor,
          background: lightGreen,
          onBackground:lightPryColor,
          surface: Colors.white,
          onSurface: Colors.black
      ),
      scaffoldBackgroundColor: lightGreen,
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: lightPryColor,
          iconTheme: IconThemeData(color: Colors.white)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: lightPryColor
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          subtitle1: TextStyle(
              color: lightPryColor, fontSize: 22, fontWeight: FontWeight.w400),
          bodyText1: TextStyle(
            fontSize: 12,
            color: Colors.black
          )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: lightPryColor,
        unselectedItemColor: Colors.grey,
      )
  );
  static final ThemeData Darkheme = ThemeData(
      primaryColor: darkPryColor,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF707070)
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700),
          subtitle1: TextStyle(
              color: lightPryColor, fontSize: 25, fontWeight: FontWeight.w400)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: lightPryColor,
        unselectedItemColor: Colors.black,
      ));
}
