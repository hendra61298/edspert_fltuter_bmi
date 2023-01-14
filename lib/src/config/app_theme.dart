

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_bmi/src/config/app_color.dart';

class AppTheme{
  static final themeData = ThemeData(
    primaryColor: AppColor.mainPurpleColor,
    fontFamily: GoogleFonts.rubik().fontFamily,
    scaffoldBackgroundColor: AppColor.secondPurple,
  );
}