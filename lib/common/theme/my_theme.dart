
import 'package:flutter/material.dart';
import 'package:poolino/common/poolino_colors.dart';

class MyThemes {
  static ThemeData get darkTheme => ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      displayLarge: TextStyle(color:Colors.white, fontFamily: "regular", fontSize: 57),
      displayMedium: TextStyle(color:Colors.white, fontFamily: "regular", fontSize: 45),
      displaySmall: TextStyle(color:Colors.white, fontFamily: "regular", fontSize: 36),
      headlineLarge: TextStyle(color:Colors.white, fontFamily: "regular", fontSize: 32),
      headlineMedium: TextStyle(color:Colors.white, fontFamily: "regular", fontSize: 28),
      headlineSmall: TextStyle(color:Colors.white, fontFamily: "regular", fontSize: 24),
      titleLarge: TextStyle(color:Colors.white, fontFamily: "medium", fontSize: 22),
      titleMedium: TextStyle(color:Colors.white, fontFamily: "medium", fontSize: 16),
      titleSmall: TextStyle(color:Colors.white, fontFamily: "medium", fontSize: 14),
      bodyLarge: TextStyle(color:Colors.white, fontFamily: "regular", fontSize: 16),
      bodyMedium: TextStyle(color:Colors.white, fontFamily: "regular", fontSize: 14),
      bodySmall: TextStyle(color:Colors.white, fontFamily: "regular", fontSize: 12),
      labelLarge: TextStyle(color:Colors.white, fontFamily: "medium", fontSize: 14),
      labelMedium: TextStyle(color:Colors.white, fontFamily: "medium", fontSize: 12),
      labelSmall: TextStyle(color:Colors.white, fontFamily: "medium", fontSize: 11),
    ),
    primaryColor: PoolinoColors.baseColor,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: PoolinoColors.baseColor,
        onPrimary: Colors.red,
        secondary: Colors.green,
        onSecondary: Colors.blue,
        error: Colors.orange,
        onError: Colors.pink,
        background: Colors.black,
        onBackground: Colors.amber,
        surface: Colors.cyanAccent,
        onSurface: Colors.purple)
  );

  static ThemeData get lightTheme => ThemeData.light().copyWith(
      textTheme: const TextTheme(
      displayLarge: TextStyle(color:Colors.black, fontFamily: "regular", fontSize: 57),
      displayMedium: TextStyle(color:Colors.black, fontFamily: "regular", fontSize: 45),
      displaySmall: TextStyle(color:Colors.black, fontFamily: "regular", fontSize: 36),
      headlineLarge: TextStyle(color:Colors.black, fontFamily: "regular", fontSize: 32),
      headlineMedium: TextStyle(color:Colors.black, fontFamily: "regular", fontSize: 28),
      headlineSmall: TextStyle(color:Colors.black, fontFamily: "regular", fontSize: 24),
      titleLarge: TextStyle(color:Colors.black, fontFamily: "medium", fontSize: 22),
      titleMedium: TextStyle(color:Colors.black, fontFamily: "medium", fontSize: 16),
      titleSmall: TextStyle(color:Colors.black, fontFamily: "medium", fontSize: 14),
      bodyLarge: TextStyle(color:Colors.black, fontFamily: "regular", fontSize: 16),
      bodyMedium: TextStyle(color:Colors.black, fontFamily: "regular", fontSize: 14),
      bodySmall: TextStyle(color:Colors.black, fontFamily: "regular", fontSize: 12),
      labelLarge: TextStyle(color:Colors.black, fontFamily: "medium", fontSize: 14),
      labelMedium: TextStyle(color:Colors.black, fontFamily: "medium", fontSize: 12),
      labelSmall: TextStyle(color:Colors.black, fontFamily: "medium", fontSize: 11),
    ),
      primaryColor: PoolinoColors.baseColor,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: PoolinoColors.baseColor,
          onPrimary: Colors.lightGreenAccent,
          secondary: Colors.green,
          onSecondary: Colors.blue,
          error: Colors.red,
          onError: Colors.pink,
          background: Colors.red,
          onBackground: Colors.grey,
          surface: Colors.cyanAccent,
          onSurface: Colors.purple,
      )

  );


}
