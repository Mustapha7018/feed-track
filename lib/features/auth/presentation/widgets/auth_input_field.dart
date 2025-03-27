import 'package:flutter/material.dart';
import 'package:feed_track/core/theme/app_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final FocusNode? focusNode;
  final bool isEnabled;
  final TextInputAction? textInputAction;
  final Function()? onEditingComplete;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? leftPadding;
  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final TextStyle? hintTextStyle;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final bool autoFocus;
  final String? errorText;
  final double borderRadius;

  const AuthInputField({
    super.key,
    required this.hintText,
    this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.isEnabled = true,
    this.textInputAction,
    this.onEditingComplete,
    this.suffixIcon,
    this.prefixIcon,
    this.contentPadding,
    this.horizontalPadding,
    this.verticalPadding,
    this.leftPadding,
    this.topPadding,
    this.rightPadding,
    this.bottomPadding,
    this.hintTextStyle,
    this.maxLines = 1,
    this.minLines,
    this.fillColor,
    this.autoFocus = false,
    this.errorText,
    this.borderRadius = 10.0,
  });

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  bool _obscureText = true;

  // Helper method to calculate the effective padding
  EdgeInsetsGeometry _getEffectivePadding() {
    // If contentPadding is provided, use it directly
    if (widget.contentPadding != null) {
      return widget.contentPadding!;
    }
    
    // If any specific padding values are provided, create a custom EdgeInsets
    if (widget.horizontalPadding != null || 
        widget.verticalPadding != null ||
        widget.leftPadding != null ||
        widget.topPadding != null ||
        widget.rightPadding != null ||
        widget.bottomPadding != null) {
      
      // Start with all edges at 0
      double left = 0;
      double top = 0;
      double right = 0;
      double bottom = 0;
      
      // Apply horizontal padding if provided
      if (widget.horizontalPadding != null) {
        left = widget.horizontalPadding!;
        right = widget.horizontalPadding!;
      }
      
      // Apply vertical padding if provided
      if (widget.verticalPadding != null) {
        top = widget.verticalPadding!;
        bottom = widget.verticalPadding!;
      }
      
      // Override with specific edge padding if provided
      if (widget.leftPadding != null) left = widget.leftPadding!;
      if (widget.topPadding != null) top = widget.topPadding!;
      if (widget.rightPadding != null) right = widget.rightPadding!;
      if (widget.bottomPadding != null) bottom = widget.bottomPadding!;
      
      return EdgeInsets.fromLTRB(left, top, right, bottom);
    }
    
    // Default padding if nothing specific is provided
    return EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.9.h);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword && _obscureText,
      obscuringCharacter: '●',
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      onChanged: widget.onChanged,
      focusNode: widget.focusNode,
      enabled: widget.isEnabled,
      textInputAction: widget.textInputAction,
      onEditingComplete: widget.onEditingComplete,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      minLines: widget.minLines,
      autofocus: widget.autoFocus,
      cursorColor: AppColors.primary,
      style: TextStyle(
        fontSize: (widget.isPassword && _obscureText) ? 13.sp : 16.sp,
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle ?? TextStyle(
          color: AppColors.textHint,
          fontSize: 16.sp,
        ),
        errorText: widget.errorText,
        errorStyle: TextStyle(
          color: AppColors.error,
          fontSize: 14.sp,
        ),
        filled: false,
        fillColor: widget.fillColor ?? Colors.transparent,
        contentPadding: _getEffectivePadding(),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColors.textHint,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null),        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.secondaryLight,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.secondaryLight,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: AppColors.secondaryLight.withAlpha(128),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
