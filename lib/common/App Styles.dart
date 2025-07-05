import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/common/app_colors.dart';

class AppStyles {
  static TextStyle semi30White = GoogleFonts.inter(
      fontSize: 30, fontWeight: FontWeight.w500, color: AppColor.white);
  static TextStyle semi20White = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w400, color: AppColor.white);
  static TextStyle semi16White = GoogleFonts.inter(
      fontSize: 16, fontWeight: FontWeight.w400, color: AppColor.white);
  static TextStyle semi24White = GoogleFonts.inter(
      fontSize: 24, fontWeight: FontWeight.w700, color: AppColor.white);
  static TextStyle semi14White = GoogleFonts.inter(
      fontSize: 14, fontWeight: FontWeight.w500, color: AppColor.white);
  static TextStyle semi16Primary = GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.primaryColor);
  static TextStyle semi20Primary = GoogleFonts.inter(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColor.primaryColor);
  static TextStyle semi15Primary = GoogleFonts.inter(
      fontSize: 15, fontWeight: FontWeight.w600, color: AppColor.primaryColor);
  static TextStyle semi20Black = GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.w600, color: AppColor.black);
  static TextStyle semi16Black = GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColor.black);
}
