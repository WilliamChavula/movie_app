import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';

class AppTheme {
  static ThemeData lightTheme() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: AppColors.lightThemeSwatch[50],
        brightness: Brightness.light,
        fontFamily: 'IBM Plex Sans',
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.inputFillColorLight,
          hintStyle: TextStyle(
            color: AppColors.hintTextColorLight,
            fontWeight: FontWeight.w600,
            fontSize: AppDimensions.bodyFontSize,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppDimensions.smX)),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppDimensions.smX)),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
        ),
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.chipBackgroundColorLight,
          disabledColor: Colors.grey,
          selectedColor: AppColors.chipBackgroundColor,
          secondarySelectedColor: AppColors.chipBackgroundColor,
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.smX),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(AppDimensions.smX)),
          ),
          labelStyle: TextStyle(
            color: AppColors.chipLabelColor,
            fontWeight: FontWeight.w500,
            fontSize: AppDimensions.buttonTextFontSize,
          ),
          secondaryLabelStyle: TextStyle(
            color: AppColors.bodyColorDark,
            fontWeight: FontWeight.w300,
            fontSize: AppDimensions.buttonTextFontSize,
          ),
          brightness: Brightness.light,
        ),
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: AppColors.lightThemeSwatch[900],
            primarySwatch: const MaterialColor(
              0XFF000D22,
              AppColors.lightThemeSwatch,
            )).copyWith(secondary: AppColors.accentColor),
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: AppColors.bodyColorLight,
            fontWeight: FontWeight.w300,
            fontSize: AppDimensions.bodyFontSize,
          ),
          headline4: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w700,
            fontSize: AppDimensions.primaryHeadingFontSize,
          ),
          headline6: TextStyle(
            color: AppColors.bodyColorLight,
            fontWeight: FontWeight.w600,
            fontSize: AppDimensions.secondaryHeadingFontSize,
          ),
          subtitle2: TextStyle(
            color: AppColors.bodyColorLight,
            fontWeight: FontWeight.w600,
            fontSize: AppDimensions.subTitleFontSize,
          ),
          button: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: AppDimensions.buttonTextFontSize,
            color: AppColors.bodyColorLight,
          ),
        ),
        dividerColor: AppColors.bodyColorLight,
      );

  static ThemeData darkTheme() => AppTheme.lightTheme().copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkThemeSwatch[50],
        colorScheme: ColorScheme.fromSwatch(
            backgroundColor: AppColors.darkThemeSwatch[900],
            primarySwatch: const MaterialColor(
              0XFFe3ebff,
              AppColors.darkThemeSwatch,
            )).copyWith(secondary: AppColors.accentColor),
        chipTheme: AppTheme.lightTheme().chipTheme.copyWith(
              backgroundColor: AppColors.chipBackgroundColor,
              labelStyle: TextStyle(
                color: AppColors.bodyColorDark,
                fontWeight: FontWeight.w600,
                fontSize: AppDimensions.buttonTextFontSize,
              ),
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: AppColors.borderColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(AppDimensions.smX),
                ),
              ),
            ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            color: AppColors.hintTextColor,
            fontWeight: FontWeight.w400,
            fontSize: AppDimensions.bodyFontSize,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppDimensions.smX)),
            borderSide: BorderSide(color: AppColors.lightThemeSwatch[600]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppDimensions.smX)),
            borderSide: BorderSide(color: AppColors.lightThemeSwatch[600]!),
          ),
        ),
        textTheme: TextTheme(
          bodyText2: AppTheme.lightTheme()
              .textTheme
              .bodyText2!
              .copyWith(color: AppColors.bodyColorDark),
          headline4: AppTheme.lightTheme()
              .textTheme
              .headline4!
              .copyWith(color: AppColors.bodyColorDark),
          headline6: AppTheme.lightTheme()
              .textTheme
              .headline6!
              .copyWith(color: AppColors.bodyColorDark),
          subtitle2: AppTheme.lightTheme()
              .textTheme
              .subtitle2!
              .copyWith(color: AppColors.bodyColorDark),
          button: AppTheme.lightTheme()
              .textTheme
              .button!
              .copyWith(color: AppColors.bodyColorDark),
        ),
        dividerColor: AppColors.bodyColorDark,
      );
}
