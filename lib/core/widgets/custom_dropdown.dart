import 'package:feed_track/core/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:feed_track/core/theme/app_colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomDropdown extends StatefulWidget {
  final String hintText;
  final TextStyle? hintTextStyle;
  final List<String> items;
  final String? value;
  final Function(String) onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final bool isEnabled;
  final Widget? prefix;
  final IconData? prefixIcon;
  final Color? fillColor;
  final String? errorText;

  const CustomDropdown({
    super.key,
    required this.hintText,
    this.hintTextStyle,
    required this.items,
    this.value,
    required this.onChanged,
    this.contentPadding,
    this.isEnabled = true,
    this.prefix,
    this.prefixIcon,
    this.fillColor,
    this.errorText,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled ? _showDropdownSheet : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.secondaryLight,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: widget.contentPadding ??
              EdgeInsets.symmetric(
                horizontal: 4.w,
                vertical: 1.8.h,
              ),
          child: Row(
            children: [
              if (widget.prefixIcon != null) ...[
                Icon(widget.prefixIcon, color: AppColors.textHint),
                SizedBox(width: 2.w),
              ] else if (widget.prefix != null) ...[
                widget.prefix!,
                SizedBox(width: 2.w),
              ],
              Expanded(
                child: Text(
                  widget.value ?? widget.hintText,
                  style: widget.value != null
                      ? TextStyle(
                          color: AppColors.textHint,
                          fontSize: 16.sp,
                        )
                      : (widget.hintTextStyle ??
                          TextStyle(
                            color: AppColors.textHint,
                            fontSize: 16.sp,
                          )),
                ),
              ),
              SvgPicture.asset(
                'assets/svgs/arrow_down.svg',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDropdownSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return _buildFullScreenDropdown();
      },
    );
  }

  Widget _buildFullScreenDropdown() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 90.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.hintText,
                  style: widget.hintTextStyle ?? AppTypography.bodyLarge,
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Close',
                    style: AppTypography.bodyLarge.copyWith(
                      color: AppColors.appred,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView.separated(
              itemCount: widget.items.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, thickness: 1),
              itemBuilder: (context, index) {
                final item = widget.items[index];
                final isSelected = widget.value == item;

                return InkWell(
                  onTap: () {
                    widget.onChanged(item);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.7.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: isSelected
                                ? FontWeight.w500
                                : FontWeight.normal,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.textHint,
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check,
                            color: AppColors.primary,
                            size: 20.sp,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
