import 'dart:ui';
import 'package:feed_track/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  switch (status) {
    case "Pending":
      return AppColors.appgoldLight;
    case "Reviewed":
      return AppColors.appgreenLight;
    case "Rejected":
      return AppColors.appredLight;
    default:
      return Colors.grey.shade200;
  }
}

Color getStatusTextColor(String status) {
  switch (status) {
    case "Pending":
      return AppColors.appgold;
    case "Reviewed":
      return AppColors.appgreen;
    case "Rejected":
      return AppColors.appred;
    default:
      return Colors.grey;
  }
}