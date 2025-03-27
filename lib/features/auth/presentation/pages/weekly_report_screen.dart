import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:feed_track/features/auth/presentation/pages/submit_weekly_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WeeklyReportScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const WeeklyReportScreen());
  const WeeklyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(
        title: 'Back to Dashboard',
      ),
      body: Padding(
        padding: AppSpacing.bodyWithSection,
        child: Column(
          spacing: 2.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Submit Weekly Report',
              style: AppTypography.h4,
            ),
            Container(
              padding: EdgeInsets.only(
                top: 2.h,
                left: 4.w,
                right: 4.w,
                bottom: 4.h,
              ),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.secondaryLight,
                ),
              ),
              child: Column(
                spacing: 2.h,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Submit Weekly Report',
                    style: AppTypography.bodySmall
                        .copyWith(color: Colors.black, fontSize: 14.sp),
                  ),
                  Text(
                    'Fill out the form to submit your weekly report. Please ensure all details are accurate before submission.',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.secondaryDark,
                      fontSize: 14.sp,
                    ),
                  ),
                  AppButton(
                    text: 'Submit Report',
                    textStyle: AppTypography.bodyMedium.copyWith(
                        color: AppColors.surface, fontWeight: FontWeight.bold),
                    height: 4.5.h,
                    isFullWidth: true,
                    onPressed: () {
                      Navigator.push(context, SubmitWeeklyReportScreen.route());
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
