import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:feed_track/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePasswordScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ChangePasswordScreen());
  const ChangePasswordScreen({super.key});

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
                'Change Password',
                style: AppTypography.h4,
              ),
              SizedBox(height: 4.h),
              Text(
                'Current Password',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.5.h,),
              AuthInputField(
                borderRadius: 5,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.5.h),
              ),
              SizedBox(height: 2.h),
              Text(
                'New Password',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.5.h,),
              AuthInputField(
                borderRadius: 5,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.5.h),
              ),
              SizedBox(height: 2.h),
              Text(
                'Confirm New Password',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.5.h,),
              AuthInputField(
                borderRadius: 5,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.5.h),
              ),
              SizedBox(height: 2.h),
              Text(
                'Password must contain:',
                style: AppTypography.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 0.5.h),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 4.w,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'At least 8 characters',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.5.h),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: AppColors.appgreen,
                    size: 4.w,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'One uppercase letter',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.5.h),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 4.w,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'One number',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.5.h),
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 4.w,
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    'One special character',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                spacing: 3.w,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Cancel',
                      backgroundColor: AppColors.secondary,
                      type: ButtonType.outlined,
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      borderRadius: 5,
                      textStyle: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      isFullWidth: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      text: 'Save Changes',
                      type: ButtonType.filled,
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      borderRadius: 5,
                      textStyle: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      isFullWidth: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
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