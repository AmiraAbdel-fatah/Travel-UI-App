import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travello_app/utils/AppColors.dart';

class AppStyles {
  static TextStyle extraBold36Black = GoogleFonts.mulish(
    fontSize: 36,
    fontWeight: FontWeight.w800,
    color: AppColors.blackColor,
  );
  static TextStyle light26gray = GoogleFonts.mulish(
    fontSize: 26,
    fontWeight: FontWeight.w300,
    color: AppColors.title,
  );
  static TextStyle light14gray = GoogleFonts.mulish(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.title,
  );
  static TextStyle semiBold20White = GoogleFonts.mulish(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
  );
  static TextStyle regular14Gray = GoogleFonts.mulish(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textFieldFill,
  );
  static TextStyle regular9Black = GoogleFonts.mulish(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );
  static TextStyle mixed13Black = GoogleFonts.mulish(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: AppColors.blackColor
  );
  static TextStyle bold13Primary = GoogleFonts.mulish(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: AppColors.primary
  );
}

