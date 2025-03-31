import 'package:feed_track/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../theme/app_colors.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final Function(String)? onSubmitted;
  final Widget? suffix;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool autoFocus;

  const SearchInput({
    super.key,
    this.controller,
    this.hintText = 'Search...',
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.onSubmitted,
    this.suffix,
    this.contentPadding,
    this.fillColor,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly,
        autofocus: autoFocus,
        onSubmitted: onSubmitted,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTypography.bodyMedium.copyWith(
            color: AppColors.textHint,
          ),
          filled: true,
          fillColor: fillColor ?? AppColors.surface,
          contentPadding: contentPadding ?? 
            EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.3.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.secondaryLight,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.secondaryLight,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 1.5,
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 3.w, right: 1.w),
            child: SvgPicture.asset(
              'assets/svgs/search.svg',
              height: 15,
              width: 15,
              colorFilter: ColorFilter.mode(
                AppColors.textHint,
                BlendMode.srcIn,
              ),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 10.w,
            minHeight: 5.h,
          ),
          suffixIcon: suffix,
        ),
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}