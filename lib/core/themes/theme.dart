import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoesly_app/core/themes/colors.dart';


ThemeData lightMode = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    onBackground: Colors.black,
    primary: AppColor.primaryColor,
    surface: AppColor.grey200,
    onSurface: AppColor.grey300,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColor.primaryColor),
  ),

  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.r)),
    )
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.r)),
    ),
    extendedPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
  ),
);