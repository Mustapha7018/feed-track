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
  final Widget? prefix;
  final IconData? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final bool autoFocus;
  final String? errorText;

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
    this.prefix,
    this.prefixIcon,
    this.contentPadding,
    this.maxLines = 1,
    this.minLines,
    this.fillColor,
    this.autoFocus = false,
    this.errorText,
  });

  @override
  State<AuthInputField> createState() => _AuthInputFieldState();
}

class _AuthInputFieldState extends State<AuthInputField> {
  bool _obscureText = true;

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
        hintStyle: TextStyle(
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
        contentPadding: widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.9.h),
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: AppColors.textHint)
            : widget.prefix,
        suffixIcon: widget.isPassword
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
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.secondaryLight,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.secondaryLight,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.0,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: AppColors.secondaryLight.withAlpha(128),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
