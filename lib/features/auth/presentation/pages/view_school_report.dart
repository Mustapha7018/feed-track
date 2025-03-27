import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:feed_track/core/widgets/report_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ViewSchoolReport extends StatelessWidget {
  static route() => MaterialPageRoute(builder: (context) => ViewSchoolReport());

  const ViewSchoolReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(
        title: 'Back to Dashboard',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.bodyWithSection,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Submitted Report',
                style: AppTypography.h4,
              ),
              SizedBox(height: 2.h),

              /// **School Report Card**
              SchoolReportCard(
                imageUrl: 'assets/images/aggrey.png',
                title: 'Aggrey Memorial',
                dateRange: '2024-01-01 - 2024-01-07',
                status: 'Pending',
                submittedOn: '1/8/2024, 9:00:00 AM',
                reviewedOn: '1/9/2024, 2:30:00 PM',
              ),
              SizedBox(height: 2.h),

              /// **Report Details Section**
              Container(
                padding: EdgeInsets.all(3.5.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.secondaryLight,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// **Header**
                    Text(
                      'Reported Details',
                      style: AppTypography.bodyMedium
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 1.5.h),

                    /// **Student Data**
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Student Enrolled',
                              style: AppTypography.bodyMedium
                                  .copyWith(color: AppColors.textSecondary),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              '500',
                              style: AppTypography.h4.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF454545),
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Student Fed',
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            SizedBox(height: 0.5.h),
                            Text(
                              '480',
                              style: AppTypography.h4.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF454545),
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Meals Served',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Wrap(
                      spacing: 2.w,
                      children: [
                        _mealChip('Breakfast'),
                        _mealChip('Lunch'),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Comments',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Successfully implemented new serving schedule.',
                      style: AppTypography.bodyMedium,
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Supporting Photos',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      children: [
                        _photoThumbnail('assets/images/image1.png'),
                        _photoThumbnail('assets/images/image2.png'),
                        _photoThumbnail('assets/images/image3.png'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 4.h),

              /// **Action Buttons**
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    text: 'Back to List',
                    backgroundColor: AppColors.secondary,
                    type: ButtonType.outlined,
                    icon: SvgPicture.asset(
                      'assets/svgs/arrow_back.svg',
                    ),
                    iconPosition: IconPosition.left,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.5.w,
                      vertical: 1.5.h,
                    ),
                    borderRadius: 5,
                    textStyle: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  AppButton(
                    text: 'Download',
                    type: ButtonType.filled,
                    icon: SvgPicture.asset(
                      'assets/svgs/download.svg',
                    ),
                    iconPosition: IconPosition.left,
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.5.w,
                      vertical: 1.5.h,
                    ),
                    borderRadius: 5,
                    textStyle: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mealChip(String meal) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 0.8.h,
        horizontal: 3.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.secondaryLight,
        ),
      ),
      child: Text(
        meal,
        style: AppTypography.bodySmall.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _photoThumbnail(String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: 2.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
          imagePath,
          width: 20.w,
          height: 20.w,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
