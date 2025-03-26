import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'app_colors.dart';

class AppTypography {
  // Headings
  static TextStyle get largeText => TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: Colors.white,
    height: 1.2,
    letterSpacing: -0.5,
  );

  // Headings
  static TextStyle get h1 => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
    height: 1.2,
    letterSpacing: -0.5,
  );
  
  static TextStyle get h2 => TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
    height: 1.25,
  );
  
  static TextStyle get h3 => TextStyle(
    fontSize: 21.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
    height: 1.3,
    letterSpacing: -1.5
  );
  
  static TextStyle get h4 => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
    height: 1.35,
    letterSpacing: -1.3
  );
  
  // Body text
  static TextStyle get bodyLarge => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  static TextStyle get bodyMedium => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: AppColors.textPrimary,
    height: 1.5,
  );
  
  static TextStyle get bodySmall => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: AppColors.textSecondary,
    height: 1.5,
  );
  
  // Caption text
  static TextStyle get caption => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.normal,
    fontFamily: 'Roboto',
    color: AppColors.textSecondary,
    letterSpacing: 0.2,
  );
}
