import 'package:flutter/material.dart';

class JLColors {
  static const red = Color(0xFFDB3022);
  static const black = Color(0xFF222222);
  static const lightGray = Color(0xFF9B9B9B);
  static const darkGray = Color(0xFF979797);
  static const white = Color(0xFFFFFFFF);
  static const orange = Color(0xFFFFBA49);
  static const background = Color(0xFFE5E5E5);
  static const backgroundLight = Color(0xFFF9F9F9);
  static const transparent = Color(0x00000000);
  static const success = Color(0xFF2AA952);
  static const green = Color(0xFF2AA952);
}

class JLTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: JLColors.black,
      primaryColorLight: JLColors.lightGray,
      accentColor: JLColors.red,
      bottomAppBarColor: JLColors.lightGray,
      backgroundColor: JLColors.background,
      dialogBackgroundColor: JLColors.backgroundLight,
      errorColor: JLColors.red,
      dividerColor: Colors.transparent,
      appBarTheme: theme.appBarTheme.copyWith(
          color: JLColors.white,
          iconTheme: IconThemeData(color: JLColors.black),
          textTheme: theme.textTheme.copyWith(
              caption: TextStyle(
                  color: JLColors.black,
                  fontSize: 18,
                  fontFamily: 'Metropolis',
                  fontWeight: FontWeight.w400))),
      textTheme: theme.textTheme
          .copyWith(
            title: theme.textTheme.title.copyWith(
                fontSize: 24,
                color: JLColors.black,
                fontWeight: FontWeight.w900,
                fontFamily: 'Metropolis'), //
            //red button with white text
            button: theme.textTheme.button.copyWith(
                fontSize: 14,
                color: JLColors.white,
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.w500),
          )
          .apply(fontFamily: 'Metropolis'),
      buttonTheme: theme.buttonTheme.copyWith(
        minWidth: 50,
        buttonColor: JLColors.red,
      ),
    );
  }
}
