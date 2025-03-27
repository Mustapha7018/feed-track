import 'package:feed_track/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DateIcon extends StatelessWidget {
  const DateIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svgs/calendar.svg',
      width: 3.5.w,
      height: 3.5.w,
      colorFilter: const ColorFilter.mode(AppColors.textSecondary, BlendMode.srcIn,),
    );
  }
}