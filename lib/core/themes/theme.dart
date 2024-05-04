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

  iconTheme: const IconThemeData(
    color: AppColor.primaryColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(color: AppColor.primaryColor),
  ),
  fontFamily: "Urbanist",

  /// Text Theme
  textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      labelSmall: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
  ),

  cardTheme: CardTheme(
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.r)),
    )
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: AppColor.primaryColor.withOpacity(0.5),
      minimumSize: Size(double.infinity, 50.h),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        color: Colors.white,
      ),
      backgroundColor: AppColor.primaryColor,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: Size(double.infinity, 50.h),
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        color: AppColor.primaryColor,
      ),
      backgroundColor: Colors.white,
      side: BorderSide(
        color: AppColor.grey200,
        width: 1.5.w,
      ),
      elevation: 0,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
    ),

  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColor.primaryColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.r)),
    ),
    extendedPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
  ),

  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
  ),

  sliderTheme: SliderThemeData(
    activeTrackColor: Colors.black,
    inactiveTrackColor: AppColor.grey200,
    overlayColor: Colors.black.withOpacity(0.1),
    valueIndicatorColor: Colors.transparent,
    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
    valueIndicatorStrokeColor: Colors.transparent,
    valueIndicatorTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 12.sp,
    ),
    showValueIndicator: ShowValueIndicator.always,
  ),
);