import 'package:feed_track/core/widgets/date_icon.dart';
import 'package:feed_track/core/widgets/status_badge.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_typography.dart';

class SchoolReportCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String dateRange;
  final String status;
  final String submittedOn;
  final String reviewedOn;

  const SchoolReportCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.dateRange,
    required this.status,
    required this.submittedOn,
    required this.reviewedOn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 2.w,
        left: 3.w,
        right: 3.w,
        bottom: 5.5.w,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.secondaryLight,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// **Row: Image, Title, Date & Status**
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// **School Logo**
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  imageUrl,
                  width: 15.w,
                  height: 15.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 3.w),

              /// **Title & Date**
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.bodyLarge.copyWith(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      children: [
                        DateIcon(),
                        SizedBox(width: 1.w),
                        Text(
                          dateRange,
                          style: AppTypography.bodySmall.copyWith(
                            color: Colors.grey.shade600,
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
          SizedBox(height: 1.5.h),

          /// **Divider**
          Divider(
            thickness: 1,
            color: AppColors.secondaryLight,
          ),
          SizedBox(height: 1.5.h),

          /// **Submitted & Reviewed Details**
          Text(
            'Submitted on $submittedOn',
            style: AppTypography.bodyMedium,
          ),
          Text(
            'Reviewed by Admin on $reviewedOn',
            style: AppTypography.bodyMedium,
          ),
        ],
      ),
    );
  }
}
