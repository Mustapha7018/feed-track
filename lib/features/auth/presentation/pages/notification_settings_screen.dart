import 'package:feed_track/core/theme/app_colors.dart';
import 'package:feed_track/core/theme/app_spacing.dart';
import 'package:feed_track/core/theme/app_typography.dart';
import 'package:feed_track/core/widgets/app_button.dart';
import 'package:feed_track/core/widgets/appbar.dart';
import 'package:feed_track/features/auth/presentation/widgets/notification_tiles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotificationSettingsScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
      builder: (context) => const NotificationSettingsScreen());
  const NotificationSettingsScreen({super.key});

  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool enableAllNotifications = true;
  bool reportSubmissionAlerts = true;
  bool receiveSubmissionReminders = false;
  bool stayInformedUpdates = true;

  void _toggleAllNotifications(bool value) {
    setState(() {
      enableAllNotifications = value;
      reportSubmissionAlerts = value;
      receiveSubmissionReminders = value;
      stayInformedUpdates = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: CustomAppBar(
        title: 'Back',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSpacing.bodyWithSection,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Notification Settings',
                style: AppTypography.h4,
              ),
              SizedBox(height: 2.h),
              CustomNotificationTile(
                title: 'Push Notifications',
                isEnabled: enableAllNotifications,
                subtitle: 'Enable all app notifications',
                onToggle: _toggleAllNotifications,
              ),
              CustomNotificationTile(
                title: 'Report Submission Alerts',
                subtitle: 'Get notified about report status',
                isEnabled: reportSubmissionAlerts,
                onToggle: enableAllNotifications
                    ? (value) {
                        setState(() {
                          reportSubmissionAlerts = value;
                        });
                      }
                    : (value) {},
              ),
              CustomNotificationTile(
                title: 'Receive submission reminders',
                subtitle: 'Get notified about report status',
                isEnabled: receiveSubmissionReminders,
                onToggle: enableAllNotifications
                    ? (value) {
                        setState(() {
                          receiveSubmissionReminders = value;
                        });
                      }
                    : (value) {},
              ),
              CustomNotificationTile(
                title: 'General Updates',
                subtitle: 'Stay informed about system updates',
                isEnabled: stayInformedUpdates,
                onToggle: enableAllNotifications
                    ? (value) {
                        setState(() {
                          stayInformedUpdates = value;
                        });
                      }
                    : (value) {},
              ),
              SizedBox(height: 15.h),
              Row(
                spacing: 3.w,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'Cancel',
                      backgroundColor: AppColors.secondary,
                      type: ButtonType.outlined,
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      borderRadius: 5,
                      textStyle: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      isFullWidth: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Expanded(
                    child: AppButton(
                      text: 'Save Changes',
                      type: ButtonType.filled,
                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                      borderRadius: 5,
                      textStyle: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      isFullWidth: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
