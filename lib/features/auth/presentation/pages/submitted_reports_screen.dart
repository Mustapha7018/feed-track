import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:feed_track/core/widgets/custom_dropdown.dart';
import 'package:feed_track/core/widgets/list_tile.dart';
import 'package:feed_track/features/auth/presentation/pages/view_school_report.dart';
import 'package:feed_track/features/auth/presentation/widgets/auth_input_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubmittedWeeklyReportScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => SubmittedWeeklyReportScreen());
  SubmittedWeeklyReportScreen({super.key});

  @override
  State<SubmittedWeeklyReportScreen> createState() =>
      _SubmittedWeeklyReportScreenState();

  final List<Map<String, String>> _reportData = [
    {
      'imageUrl': 'assets/images/aggrey.png',
      'title': 'Aggrey Memorial School',
      'dateRange': '2024-01-01 - 2024-01-07',
      'status': 'Pending',
    },
    {
      'imageUrl': 'assets/images/mfanti.png',
      'title': 'Mfantsipim Boys School',
      'dateRange': '2024-01-08 - 2024-01-14',
      'status': 'Reviewed',
    },
    {
      'imageUrl': 'assets/images/prempeh.png',
      'title': 'Prempeh College',
      'dateRange': '2024-01-15 - 2024-01-21',
      'status': 'Rejected',
    },
    {
      'imageUrl': 'assets/images/johns.png',
      'title': 'St. Johns Grammar',
      'dateRange': '2024-01-22 - 2024-01-28',
      'status': 'Pending',
    },
    {
      'imageUrl': 'assets/images/keta.png',
      'title': 'Keta Senior High',
      'dateRange': '2024-01-29 - 2024-02-04',
      'status': 'Reviewed',
    },
  ];
}

class _SubmittedWeeklyReportScreenState
    extends State<SubmittedWeeklyReportScreen> {
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
                'Submitted Reports',
                style: AppTypography.h4,
              ),
              SizedBox(height: 1.h),
              AuthInputField(
                hintText: 'Search by school name...',
                prefixIcon: const Icon(Icons.search),
                keyboardType: TextInputType.text,
                horizontalPadding: 2.5.w,
                verticalPadding: 2.5.w,
                borderRadius: 5,
                hintTextStyle: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textHint,
                ),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdown(
                          hintText: 'Select Region',
                          hintTextStyle: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textHint,
                          ),
                          contentPadding: EdgeInsets.all(3.w),
                          items: const ['Region 1', 'Region 2', 'Region 3'],
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomDropdown(
                          hintText: 'Status',
                          hintTextStyle: AppTypography.bodyMedium.copyWith(
                            color: AppColors.textHint,
                          ),
                          contentPadding: EdgeInsets.all(3.w),
                          items: const [
                            'Pending',
                            'Reviewed',
                            'Rejected'
                          ], // Fixed incorrect items
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3.5.h),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget._reportData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 1.h),
                    child: CustomListTile(
                      onTilePressed: () {
                        Navigator.push(context, ViewSchoolReport.route());
                      },
                      imageUrl: widget._reportData[index]['imageUrl']!,
                      title: widget._reportData[index]['title']!,
                      dateRange: widget._reportData[index]['dateRange']!,
                      status: widget._reportData[index]['status']!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
