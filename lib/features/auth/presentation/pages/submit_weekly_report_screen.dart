import 'package:feed_track/core/widgets/appbar.dart';
import 'package:flutter/material.dart';

class SubmitWeeklyReportScreen extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SubmitWeeklyReportScreen());
  const SubmitWeeklyReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Back to Dashboard',
      ),
    );
  }
}
