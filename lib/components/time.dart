import 'package:flutter/material.dart';
import 'package:news_app/theme/colors.dart';
import 'package:news_app/theme/text_styles.dart';

class TimeDay extends StatelessWidget {
  const TimeDay({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.access_time,
          color: AppColors.watch,
          size: 26,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          time,
          style: AppTextStyle.timee,
        ),
      ],
    );
  }
}
