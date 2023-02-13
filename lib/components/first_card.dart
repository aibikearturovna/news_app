import 'package:flutter/material.dart';
import 'package:news_app/constants/api.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/views/second_page.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.news,
  });

  final Articles news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SecondPage(
                news: news,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Image.network(
                  news.urlToImage ?? ApiLink.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 5,
                child: Text(
                  news.title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
