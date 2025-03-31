import 'package:feed_track/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.85, 
      child: Switch(
        value: value,
        onChanged: (newValue) {
          onChanged(newValue);
        },
        activeColor: Colors.white,
        activeTrackColor: AppColors.primary,
        inactiveThumbColor: AppColors.secondary,
        inactiveTrackColor: AppColors.secondaryLight,
        trackOutlineWidth: const WidgetStatePropertyAll(-1),
        thumbIcon: WidgetStateProperty.resolveWith<Icon?>((states) {
          if (!states.contains(WidgetState.selected)) {
            return const Icon(Icons.circle, color: Colors.transparent, size: 12);
          }
          return null; 
        }),
      ),
    );
  }
}