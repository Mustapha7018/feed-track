import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  final double? fontSize;
  final EdgeInsets? padding;
  final double? borderRadius;
  
  const StatusBadge({
    super.key, 
    required this.status,
    this.fontSize,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 0.9.h),
      decoration: BoxDecoration(
        color: getStatusColor(status),
        borderRadius: BorderRadius.circular(borderRadius ?? 5),
      ),
      child: Text(
        status,
        style: AppTypography.bodySmall.copyWith(
          color: getStatusTextColor(status),
          fontSize: fontSize ?? 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}