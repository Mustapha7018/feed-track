import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:feed_track/core/widgets/custom_dropdown.dart';
import 'package:feed_track/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const EditProfileScreen());
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(
        title: 'Back',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.bodyPadding,
          child: Column(
            spacing: 2.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit Profile',
                style: AppTypography.h4,
              ),
              Align(
                child: Stack(
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
              ),
              Text(
                'Full Name',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AuthInputField(
                initialVal: 'John Mensah',
                borderRadius: 5,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.5.h),
              ),
              Text(
                'Email',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              AuthInputField(
                initialVal: 'email@mail.com',
                borderRadius: 5,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 3.5.w, vertical: 1.5.h),
              ),
              Text(
                'Region',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomDropdown(
                hintText: 'Central',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.5.h,
                ),
                items: [],
                onChanged: (value) {},
              ),
              Text(
                'Region',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomDropdown(
                hintText: 'District',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 4.w,
                  vertical: 1.5.h,
                ),
                items: [],
                onChanged: (value) {},
              ),
              SizedBox(height: 2.h,),
              /// **Action Buttons**
              Row(
                spacing: 2.h,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Cancel',
                      backgroundColor: AppColors.secondary,
                      type: ButtonType.outlined,
                      padding: EdgeInsets.symmetric(
                        vertical: 1.5.h,
                      ),
                      borderRadius: 5,
                      textStyle: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
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
                      padding: EdgeInsets.symmetric(
                        vertical: 1.5.h,
                      ),
                      borderRadius: 5,
                      textStyle: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
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
