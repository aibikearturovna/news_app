import 'package:flutter/material.dart';
import 'package:news_app/theme/colors.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.button,
        ),
        onPressed: onPressed,
        child: const Text('READ MORE'),
      ),
    );
  }
}
