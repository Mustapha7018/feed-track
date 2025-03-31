import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:feed_track/core/widgets/custom_tile.dart';
import 'package:feed_track/features/auth/presentation/pages/change_password_screen.dart';
import 'package:feed_track/features/auth/presentation/pages/contact_support_screen.dart';
import 'package:feed_track/features/auth/presentation/pages/edit_profile_screen.dart';
import 'package:feed_track/features/auth/presentation/pages/notification_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const ProfileScreen());
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(isProfile: true),
      body: Padding(
        padding: AppSpacing.bodyWithSection,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 10.w,
                    backgroundImage: AssetImage(
                      'assets/images/user_profile.png',
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(1.w),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: AppColors.primary,
                        size: 5.w,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                'John Mensah',
                style: AppTypography.bodyLarge.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                'johnmensah22@gmail.com',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 3.h),
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: AppColors.secondaryLight, width: 0.2.w),
                  borderRadius: BorderRadius.circular(2.w),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Region/District',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          'Last login: 2024-12-18 09:30 AM',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      'Central Region | Abura District',
                      style: AppTypography.bodyLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 3.h),
              CustomTile(
                icon: 'assets/svgs/user.svg',
                title: 'Edit Profile Information',
                onTap: () {
                  Navigator.push(context, EditProfileScreen.route());
                },
              ),
              SizedBox(height: 2.h),
              CustomTile(
                icon: 'assets/svgs/lock.svg',
                title: 'Change Password',
                onTap: () {
                  Navigator.push(context, ChangePasswordScreen.route());
                },
              ),
              SizedBox(height: 2.h),
              CustomTile(
                icon: 'assets/svgs/notification.svg',
                title: 'Notification Settings',
                onTap: () {
                  Navigator.push(context, NotificationSettingsScreen.route());
                },
              ),
              SizedBox(height: 2.h),
              CustomTile(
                icon: 'assets/svgs/contact.svg',
                title: 'Contact Support',
                onTap: () {
                  Navigator.push(context, ContactSupportScreen.route());
                },
              ),
              SizedBox(height: 3.h),
              AppButton(
                text: 'Delete Account',
                backgroundColor: AppColors.appred,
                iconPosition: IconPosition.left,
                icon: SvgPicture.asset(
                  'assets/svgs/delete_icon.svg',
                ),
                textStyle: AppTypography.bodyMedium.copyWith(
                  color: AppColors.surface,
                  fontWeight: FontWeight.bold,
                ),
                height: 5.h,
                borderRadius: 5,
                isFullWidth: true,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
