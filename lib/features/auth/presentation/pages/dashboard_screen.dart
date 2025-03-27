import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:feed_track/features/auth/presentation/pages/weekly_report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const DashboardScreen());

  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const CustomAppBar(
        isDashboard: true,
        title: 'John Doe',
      ),
      body: Padding(
        padding: AppSpacing.bodyWithSection,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dashboard",
                style: AppTypography.h4,
              ),

              SizedBox(height: 2.h),

              // Overview Card
              Card(
                elevation: 0,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.secondaryLight),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Overview",
                        style: AppTypography.bodySmall.copyWith(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Reports Submitted: 5/52 (This Year)",
                        style: AppTypography.bodyLarge.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Next Report Due: June 25, 2024",
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        "Yearly Progress",
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.secondaryDark,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(height: 0.5.h),
                      LinearProgressIndicator(
                        value: 10 / 52,
                        minHeight: 7,
                        backgroundColor: AppColors.secondaryLight,
                        borderRadius: BorderRadius.circular(50),
                        valueColor: AlwaysStoppedAnimation(
                          AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 2.h),

              // Weekly Report Call to Action
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.5.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ready to Submit Your Weekly Report?",
                            style: AppTypography.bodyMedium.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          Text(
                            "Keep track of your school's feeding program progress",
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      text: 'Submit Report',
                      isResponsive: false,
                      backgroundColor: AppColors.primaryDark,
                      padding: EdgeInsets.symmetric(
                          horizontal: 2.5.w, vertical: 1.h),
                      textStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      onPressed: () {
                        Navigator.push(context, WeeklyReportScreen.route());
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.h),

              // Notification Section
              Card(
                elevation: 0,
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.secondaryLight),
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/bell.svg',
                            height: 2.h,
                          ),
                          SizedBox(width: 2.w),
                          Text(
                            "Notification",
                            style: AppTypography.bodySmall.copyWith(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      _notificationItem(
                          "Reminder: Submit your weekly report for Central High ....",
                          AppColors.appgreen),
                      SizedBox(height: 1.h),
                      _notificationItem(
                          "Your submission for Week 23 has been approved.",
                          AppColors.appgreen),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 2.h),

              // Buttons
              _dashboardButton("View Submitted Report", () {}),
              _dashboardButton("Update Profile", () {}),
              _dashboardButton("Contact Support", () {}),
            ],
          ),
        ),
      ),
    );
  }

  // Notification List Item
  Widget _notificationItem(String text, Color dotColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.5.h),
      decoration: BoxDecoration(
          color: Color(0xFFF6F7FB), borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 12.sp,
              color: dotColor,
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 13.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Dashboard Buttons
  Widget _dashboardButton(String text, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 1.8.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            side: BorderSide(
              color: AppColors.secondaryLight,
            ),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
