import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/theme/app_spacing.dart';

enum ButtonType {
  filled,
  outlined,
}

enum IconPosition {
  left,
  right,
  none,
}

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final IconPosition iconPosition;
  final Widget? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final bool isLoading;
  final bool isFullWidth;
  final bool isResponsive;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.filled,
    this.iconPosition = IconPosition.none,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.width,
    this.height,
    this.isLoading = false,
    this.isFullWidth = false,
    this.isResponsive = false,
    this.borderRadius = 10.0,
    this.padding,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    // Determine colors based on button type and state
    final bool isDisabled = onPressed == null || isLoading;
    
    // Default colors based on type
    final Color defaultBgColor = type == ButtonType.filled 
        ? AppColors.primary 
        : Colors.transparent;

    final Color defaultTextColor = type == ButtonType.filled 
        ? Colors.white 
        : AppColors.primary;

    final Color defaultBorderColor = type == ButtonType.outlined 
        ? AppColors.secondaryLight 
        : Colors.transparent;

    // Apply colors (custom or default)
    final Color bgColor = isDisabled 
        ? (type == ButtonType.filled ? AppColors.secondaryLight : Colors.transparent)
        : (backgroundColor ?? defaultBgColor);

    final Color txtColor = isDisabled 
        ? AppColors.textHint
        : (textColor ?? defaultTextColor);

    final Color brdColor = isDisabled 
        ? (type == ButtonType.outlined ? AppColors.secondaryLight : Colors.transparent)
        : (borderColor ?? defaultBorderColor);

    // Button text style
    final TextStyle buttonTextStyle = textStyle ?? AppTypography.bodyLarge.copyWith(
      color: txtColor,
      fontWeight: FontWeight.w500,
    );

    // Calculate responsive border radius if needed
    final double responsiveBorderRadius = isResponsive ? borderRadius.sp : borderRadius;

    // Default button padding
    final EdgeInsetsGeometry buttonPadding = padding ?? 
        EdgeInsets.symmetric(
          horizontal: isResponsive ? 5.w : 16.0,
          vertical: isResponsive ? 1.5.h : 12.0,
        );

    // Button content
    Widget buttonContent() {
      if (isLoading) {
        return SizedBox(
          height: isResponsive ? 2.h : 16,
          width: isResponsive ? 2.h : 16,
          child: CircularProgressIndicator.adaptive(
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(txtColor),
          ),
        );
      }

      if (iconPosition == IconPosition.none || icon == null) {
        return Text(text, style: buttonTextStyle);
      }

      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) ...[
            icon!,
            AppSpacing.horizontalGapSmall,
          ],
          Text(text, style: buttonTextStyle),
          if (iconPosition == IconPosition.right) ...[
            AppSpacing.horizontalGapSmall,
            icon!,
          ],
        ],
      );
    }

    // Build the button with appropriate size
    Widget buttonWidget = type == ButtonType.filled
        ? ElevatedButton(
            onPressed: isDisabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: bgColor,
              disabledBackgroundColor: AppColors.secondaryLight,
              padding: buttonPadding,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(responsiveBorderRadius),
              ),
              elevation: 0,
            ),
            child: buttonContent(),
          )
        : OutlinedButton(
            onPressed: isDisabled ? null : onPressed,
            style: OutlinedButton.styleFrom(
              backgroundColor: bgColor,
              padding: buttonPadding,
              side: BorderSide(color: brdColor, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(responsiveBorderRadius),
              ),
            ),
            child: buttonContent(),
          );

    // Apply size constraints if specified
    if (width != null || height != null || isFullWidth) {
      final double? buttonWidth = isFullWidth 
          ? double.infinity 
          : (width != null ? (isResponsive ? width!.w : width!) : null);
          
      buttonWidget = SizedBox(
        width: buttonWidth,
        height: height != null ? (isResponsive ? height!.h : height!) : null,
        child: buttonWidget,
      );
    }

    return buttonWidget;
  }
}