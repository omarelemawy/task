import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'font_manager.dart';

ThemeData get applicationTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldColor,

      /// Main Color

      primaryColor: AppColors.mainApp,
      primaryColorLight: AppColors.lightMainApp,
      primaryColorDark: Colors.black,
      disabledColor: Colors.grey,

      /// CardViewTheme

      cardTheme: const CardTheme(),

      /// AppBar Theme

      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor:
              Colors.black, // set Status bar color in Android devices
          statusBarIconBrightness:
              Brightness.light, // set Status bar icons color in Android devices
        ),
        backgroundColor: AppColors.scaffoldColor,
        titleTextStyle: TextStyle(
            fontSize: 19,
            fontWeight: FontWeightManger.bold,
            color: Colors.white),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),

      /// Button Theme

      buttonTheme: const ButtonThemeData(),

      /// Elevated Button Theme

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeightManger.regular,
                color: Colors.white,
              ),
              backgroundColor: AppColors.mainApp)),

      /// Text Theme

      textTheme: const TextTheme(
        //
        headlineLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeightManger.bold,
          color: Colors.white,
        ),

        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeightManger.medium,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeightManger.regular,
          color: Colors.grey,
        ),
        labelMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeightManger.regular,
          color: Colors.red,
        ),
        bodySmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeightManger.regular,
          color: Colors.black,
        ),
      ),

      /// Input Decoration Theme (text form filed)
    );
