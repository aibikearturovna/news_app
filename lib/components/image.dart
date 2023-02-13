import 'package:flutter/material.dart';
import 'package:news_app/constants/api.dart';
import 'package:news_app/models/articles.dart';

class Images extends StatelessWidget {
  const Images({
    super.key,
    required this.news,
  });

  final Articles news;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      news.urlToImage ?? ApiLink.image,
    );
  }
}
