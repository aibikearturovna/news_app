import 'package:flutter/material.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/theme/text_styles.dart';

class AboutNews extends StatelessWidget {
  const AboutNews({
    super.key,
    required this.news,
  });

  final Articles news;

  @override
  Widget build(BuildContext context) {
    return Text(
      news.description ?? '',
      style: AppTextStyle.descrip,
    );
  }
}
