// ignore_for_file: unused_field

import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:feed_track/core/widgets/custom_dropdown.dart';
import 'package:feed_track/features/auth/presentation/pages/submitted_reports_screen.dart';
import 'package:feed_track/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubmitWeeklyReportScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SubmitWeeklyReportScreen());
  const SubmitWeeklyReportScreen({super.key});

  @override
  State<SubmitWeeklyReportScreen> createState() =>
      _SubmitWeeklyReportScreenState();
}

class _SubmitWeeklyReportScreenState extends State<SubmitWeeklyReportScreen> {
  // State variables for dropdowns
  String? _selectedSchool;
  String? _selectedRegion;
  final List<String?> _selectedMealTypes = [null];

  // Text controllers for text inputs
  final _townController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  final _enrolledController = TextEditingController();
  final _fedController = TextEditingController();
  final _commentsController = TextEditingController();

  // Placeholder for date picker
  void _pickDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = "${picked.month}/${picked.day}/${picked.year}";
    }
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    _townController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    _enrolledController.dispose();
    _fedController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  // Helper widget for field labels
  Widget _buildFieldLabel(String label) {
    return Text(
      label,
      style: AppTypography.bodySmall.copyWith(
        color: Colors.black,
        fontSize: 14.sp,
      ),
    );
  }

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
                'Submit Weekly Report',
                style: AppTypography.h4,
              ),
              SizedBox(height: 2.h),

              // School Information Section
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondaryLight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'School Information',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    CustomDropdown(
                      hintText: 'Select School',
                      hintTextStyle: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textHint,
                      ),
                      contentPadding: EdgeInsets.all(3.w),
                      items: const [
                        'School A',
                        'School B',
                        'School C'
                      ], // Example items
                      onChanged: (value) {
                        setState(() {
                          _selectedSchool = value;
                        });
                      },
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Town'),
                              SizedBox(height: 1.h),
                              AuthInputField(
                                hintText: 'Town',
                                controller: _townController,
                                keyboardType: TextInputType.text,
                                horizontalPadding: 2.5.w,
                                verticalPadding: 2.5.w,
                                borderRadius: 5,
                                hintTextStyle:
                                    AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textHint,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Region'),
                              SizedBox(height: 1.h),
                              CustomDropdown(
                                hintText: 'Select Region',
                                hintTextStyle:
                                    AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textHint,
                                ),
                                contentPadding: EdgeInsets.all(3.w),
                                items: const [
                                  'Region 1',
                                  'Region 2',
                                  'Region 3'
                                ], // Example items
                                onChanged: (value) {
                                  setState(() {
                                    _selectedRegion = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.h),

              // Reporting Period Section
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondaryLight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Reporting Period',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Week Start Date'),
                              SizedBox(height: 1.h),
                              AuthInputField(
                                hintText: 'mm/dd/yyy',
                                hintTextStyle:
                                    AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textHint,
                                ),
                                horizontalPadding: 2.5.w,
                                verticalPadding: 2.5.w,
                                borderRadius: 5,
                                controller: _startDateController,
                                keyboardType: TextInputType.datetime,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: AppColors.textHint,
                                    size: 1.5.h,
                                  ),
                                  onPressed: () => _pickDate(
                                    context,
                                    _startDateController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('Week End Date'),
                              SizedBox(height: 1.h),
                              AuthInputField(
                                horizontalPadding: 2.5.w,
                                verticalPadding: 2.5.w,
                                borderRadius: 5,
                                hintText: 'mm/dd/yyy',
                                hintTextStyle:
                                    AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textHint,
                                ),
                                controller: _endDateController,
                                keyboardType: TextInputType.datetime,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: AppColors.textHint,
                                    size: 1.5.h,
                                  ),
                                  onPressed: () =>
                                      _pickDate(context, _endDateController),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.h),

              // Attendance Information Section
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondaryLight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Attendance Information',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('No. of Students Enrolled'),
                              SizedBox(height: 1.h),
                              AuthInputField(
                                horizontalPadding: 2.5.w,
                                verticalPadding: 2.5.w,
                                borderRadius: 5,
                                hintText: '0',
                                hintTextStyle:
                                    AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textHint,
                                ),
                                controller: _enrolledController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildFieldLabel('No. of Students Fed'),
                              SizedBox(height: 1.h),
                              AuthInputField(
                                horizontalPadding: 2.5.w,
                                verticalPadding: 2.5.w,
                                borderRadius: 5,
                                hintText: '0',
                                hintTextStyle:
                                    AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textHint,
                                ),
                                controller: _fedController,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.h),

              // Meal Types Served Section
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondaryLight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meal Types Served',
                          style: AppTypography.bodySmall.copyWith(
                            color: Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              _selectedMealTypes.add(null);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    ..._selectedMealTypes.asMap().entries.map((entry) {
                      int index = entry.key;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child: CustomDropdown(
                          hintText: 'Select meal type',
                          hintTextStyle: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textHint,
                          ),
                          contentPadding: EdgeInsets.all(3.w),
                          items: const [
                            'Breakfast',
                            'Lunch',
                            'Snack'
                          ], // Example items
                          onChanged: (value) {
                            setState(() {
                              _selectedMealTypes[index] = value;
                            });
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),

              SizedBox(height: 2.h),

              // Challenges/Comments Section
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondaryLight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Challenges/Comments',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    AuthInputField(
                      hintText:
                          'Describe any challenges faced during the week...',
                      hintTextStyle: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textHint,
                      ),
                      borderRadius: 5,
                      controller: _commentsController,
                      maxLines: 4,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 2.h),

              // Supporting Photos Section
              Container(
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.secondaryLight),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Supporting Photos',
                      style: AppTypography.bodySmall.copyWith(
                        color: Colors.black,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 15.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.secondaryLight,
                            // style: BorderStyle.dashed,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.cloud_upload,
                                size: 3.h,
                                color: AppColors.textHint,
                              ),
                              SizedBox(height: 1.h),
                              Text(
                                'Drop photos here or click to upload',
                                style: AppTypography.bodyMedium.copyWith(
                                  color: AppColors.textHint,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 4.h),
              // Bottom Buttons
              Row(
                spacing: 1.5.h,
                children: [
                  AppButton(
                    text: 'Back',
                    type: ButtonType.outlined,
                    icon: SvgPicture.asset(
                      'assets/svgs/arrow_back.svg',
                    ),
                    iconPosition: IconPosition.left,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.5.w,
                      vertical: 1.h,
                    ),
                    borderRadius: 5,
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  AppButton(
                    text: 'Save as Draft',
                    type: ButtonType.outlined,
                    icon: SvgPicture.asset(
                      'assets/svgs/save_icon.svg',
                    ),
                    iconPosition: IconPosition.left,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.5.w,
                      vertical: 1.h,
                    ),
                    borderRadius: 5,
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed: () {},
                  ),
                  AppButton(
                    text: 'Submit Report',
                    isResponsive: false,
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.5.w,
                      vertical: 1.h,
                    ),
                    borderRadius: 5,
                    textStyle: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context, SubmittedWeeklyReportScreen.route());
                    },
                  ),
                ],
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
