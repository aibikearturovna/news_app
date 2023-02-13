import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/theme/text_styles.dart';

class SecondTitle extends StatelessWidget {
  const SecondTitle({
    super.key,
    required this.news,
  });

  final Articles news;

  @override
  Widget build(BuildContext context) {
    return Text(
      news.title,
      textAlign: TextAlign.center,
      style: AppTextStyle.newsTitle,
    );
  }
}
