import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDashboard;
  final String title;
  final VoidCallback? onMenuTap;
  final VoidCallback? onBackTap;

  const CustomAppBar({
    super.key,
    this.isDashboard = false,
    this.title = '',
    this.onMenuTap,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isDashboard,
      leadingWidth: isDashboard ? 10.w : 5.w,
      backgroundColor: isDashboard ? AppColors.primary : Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: isDashboard
          ? Padding(
              padding: EdgeInsets.all(2.w),
              child: SvgPicture.asset(
                'assets/svgs/logo.svg',
              ),
            )
          : IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 18.sp,
              ),
              onPressed: onBackTap ?? () => Navigator.pop(context),
            ),
      title: isDashboard
          ? RichText(
              text: TextSpan(
                text: 'Welcome! ',
                style: AppTypography.bodyLarge.copyWith(
                  color: AppColors.surface,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: title,
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.surface,
                    ),
                  ),
                ],
              ),
            )
          : Text(
              title,
              style: AppTypography.bodyMedium,
            ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: isDashboard ? Colors.white : Colors.black,
            size: 20.sp,
          ),
          onPressed: onMenuTap,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(7.h);
}
