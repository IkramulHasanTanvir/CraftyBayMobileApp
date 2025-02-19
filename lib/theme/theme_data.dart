import 'package:crafty_bay/theme/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppThemeData {
  /// Light theme set.
  static ThemeData get lightTheme => ThemeData(
      fontFamily: 'Poppins',
      colorSchemeSeed: primaryColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
      ),
      scaffoldBackgroundColor: Colors.grey.shade300,
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              foregroundColor: Colors.white,
              fixedSize: const Size.fromWidth(double.maxFinite),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
              textStyle:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
              padding: EdgeInsets.symmetric(vertical: 12.h))),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColor)));

  /// Dark theme set.
  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        colorSchemeSeed: primaryColor,
        scaffoldBackgroundColor: Colors.grey.shade900,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: primaryColor,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w600),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 1),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                fixedSize: const Size.fromWidth(double.maxFinite),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r)),
                textStyle:
                    TextStyle(fontWeight: FontWeight.w400, fontSize: 16.sp),
                padding: EdgeInsets.symmetric(vertical: 12.h))),
      );
}
