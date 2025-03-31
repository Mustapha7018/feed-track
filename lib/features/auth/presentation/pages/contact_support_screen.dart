import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactSupportScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ContactSupportScreen());
  const ContactSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(
        title: 'Back',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.bodyWithSection,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Support',
                style: AppTypography.h4,
              ),
              SizedBox(height: 4.h),
              Text(
                'Frequently Asked Questions',
                style: AppTypography.bodyLarge.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2.h),
              ExpansionTile(
                tilePadding: EdgeInsets.only(left: 1.h),
                title: Text(
                  'How do I submit a weekly report?',
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                ),
                shape: Border(
                  bottom: BorderSide(
                    color: AppColors.secondaryLight,
                    width: 1,
                  ),
                ),
                collapsedShape: Border(
                  bottom: BorderSide(
                    color: AppColors.secondaryLight,
                    width: 1,
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    child: Text(
                      'To submit a weekly report, navigate to the Reports section in the app, click on "New Report," fill in the required details, and press the Submit button.',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                tilePadding: EdgeInsets.only(left: 1.h),
                title: Text(
                  'Can I edit a submitted report?',
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                ),
                shape: Border(
                  bottom: BorderSide(
                    color: AppColors.secondaryLight,
                    width: 1,
                  ),
                ),
                collapsedShape: Border(
                  bottom: BorderSide(
                    color: AppColors.secondaryLight,
                    width: 1,
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                       horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    child: Text(
                      'Yes, you can edit a submitted report within 24 hours of submission. Go to the Reports section, find your report, and click "Edit."',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                tilePadding: EdgeInsets.only(left: 1.h),
                title: Text(
                  'How do I submit a weekly report?',
                  style: AppTypography.bodyLarge.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                  ),
                ),
                shape: Border(
                  bottom: BorderSide(
                    color: AppColors.secondaryLight,
                    width: 1,
                  ),
                ),
                collapsedShape: Border(
                  bottom: BorderSide(
                    color: AppColors.secondaryLight,
                    width: 1,
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2.w,
                      vertical: 2.h,
                    ),
                    child: Text(
                      'To submit a weekly report, navigate to the Reports section in the app, click on "New Report," fill in the required details, and press the Submit button.',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
