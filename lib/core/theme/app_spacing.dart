import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

/// A utility class that provides consistent spacing throughout the app
class AppSpacing {
  // Base paddings
  static EdgeInsets get bodyPadding => EdgeInsets.symmetric(horizontal: 5.w);
  
  // Section paddings
  static EdgeInsets get sectionPadding => EdgeInsets.symmetric(vertical: 3.h);
  static EdgeInsets get smallSectionPadding => EdgeInsets.symmetric(vertical: 1.5.h);
  static EdgeInsets get largeSectionPadding => EdgeInsets.symmetric(vertical: 5.h);
  
  // Combine body and section paddings
  static EdgeInsets get bodyWithSection => bodyPadding.copyWith(
    top: sectionPadding.top,
    bottom: sectionPadding.bottom,
  );
  
  // Directional paddings
  static EdgeInsets get verticalSpacing => EdgeInsets.symmetric(vertical: 2.h);
  static EdgeInsets get horizontalSpacing => EdgeInsets.symmetric(horizontal: 3.w);
  
  // Insets for consistent spacing between elements
  static SizedBox get verticalGapTiny => SizedBox(height: 0.5.h);
  static SizedBox get verticalGapSmall => SizedBox(height: 1.h);
  static SizedBox get verticalGapMedium => SizedBox(height: 2.h);
  static SizedBox get verticalGapLarge => SizedBox(height: 3.h);
  static SizedBox get verticalGapXLarge => SizedBox(height: 5.h);
  
  static SizedBox get horizontalGapTiny => SizedBox(width: 1.w);
  static SizedBox get horizontalGapSmall => SizedBox(width: 2.w);
  static SizedBox get horizontalGapMedium => SizedBox(width: 3.w);
  static SizedBox get horizontalGapLarge => SizedBox(width: 5.w);
  
  // Helper methods to create custom spacing
  static SizedBox verticalGap(double height) => SizedBox(height: height.h);
  static SizedBox horizontalGap(double width) => SizedBox(width: width.w);
  
  // Screen-relative spacing
  static double get screenPaddingTop => 2.h;
  static double get screenPaddingBottom => 2.h;
}