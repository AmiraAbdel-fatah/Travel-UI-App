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
}
