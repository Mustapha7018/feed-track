import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/date_icon.dart';
import 'package:feed_track/core/widgets/status_badge.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomListTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String dateRange;
  final String status;
  final VoidCallback onTilePressed;

  const CustomListTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.dateRange,
    required this.status,
    required this.onTilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTilePressed,
      child: Container(
        padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.secondaryLight,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(2.w),
              child: Image.asset(
                imageUrl,
                width: 14.w,
                height: 14.w,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.image_not_supported,
                  size: 12.w,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(width: 3.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyMedium.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Row(
                    children: [
                      const DateIcon(),
                      SizedBox(width: 2.w),
                      Text(
                        dateRange,
                        style: AppTypography.bodyMedium.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            StatusBadge(status: status),
          ],
        ),
      ),
    );
  }
}
