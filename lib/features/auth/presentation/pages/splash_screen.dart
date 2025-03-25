import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Row(
          spacing: 2.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svgs/logo.svg',
            ),
            Text(
              'FeedTrack',
              style: AppTypography.largeText,
            ),
          ],
        ),
      ),
    );
  }
}
