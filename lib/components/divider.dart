import 'package:flutter/material.dart';
import 'package:news_app/theme/colors.dart';

class Dividerr extends StatelessWidget {
  const Dividerr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Divider(
        color: AppColors.grey,
        height: 35,
        thickness: 2,
      ),
    );
  }
}
