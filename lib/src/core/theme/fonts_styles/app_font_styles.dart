import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontStyles {
  static final FontStyles _instance = FontStyles._init();

  static FontStyles get instance => _instance;

  FontStyles._init();

  TextStyle get p14 => TextStyle(
        fontSize: 14.sp,
      );
  TextStyle get p15 => TextStyle(
        fontSize: 14.sp,
      );

  TextStyle get p12 => TextStyle(
        fontSize: 12.sp,
      );
  TextStyle get p11 => TextStyle(
        fontSize: 11.sp,
      );
  TextStyle get p10 => TextStyle(
        fontSize: 10.sp,
      );

  TextStyle get p13 => TextStyle(
        fontSize: 13.sp,
      );

  TextStyle get p16 => TextStyle(
        fontSize: 16.sp,
      );

  TextStyle get p17 => TextStyle(
        fontSize: 17.sp,
      );

  TextStyle get p18 => TextStyle(
        fontSize: 18.sp,
      );
  TextStyle get p22 => TextStyle(
        fontSize: 22.sp,
      );
  TextStyle get p28 => TextStyle(
        fontSize: 28.sp,
      );
  TextStyle get p35 => TextStyle(
        fontSize: 35.sp,
      );
}
