import 'package:flutter/material.dart';
import 'package:platnova_expense_tracker_app/widgets/expenses.dart';


var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF1C75BC)
  );

  var kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, // tell flutter you want the color to be dark
  seedColor: const Color(0xFF1C75BC)
  );

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
),
        ),
         elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      )  ,

      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color(0xFF1C75BC),
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          )
        )

      ),
      // control light theme and dark theme with theme mode
      themeMode: ThemeMode.system, // default
      home:const Expenses() ,// Todo: Add main widget here...,
    )
  );
}
 
