import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTile extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const CustomTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 1.5.h,
          horizontal: 3.w,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondaryLight,
            width: 0.2.w,
          ), // Thin border
          borderRadius: BorderRadius.circular(
            2.w,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: 3.w),
            Expanded(
              child: Text(
                title,
                style: AppTypography.bodyMedium,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 4.w,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
