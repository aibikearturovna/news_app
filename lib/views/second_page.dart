// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/components/descrip.dart';
import 'package:news_app/components/divider.dart';
import 'package:news_app/components/image.dart';
import 'package:news_app/components/read_more.dart';
import 'package:news_app/components/time.dart';
import 'package:news_app/components/title.dart';
import 'package:news_app/models/articles.dart';
import 'package:news_app/theme/colors.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Articles news;

  @override
  Widget build(BuildContext context) {
    final time = DateFormat("d MMM,y.H:m").format(
      DateTime.parse(news.publishedAt),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        title: const Text(''),
        actions: news.url != null
            ? [
                IconButton(
                  onPressed: () {
                    Share.share(news.url!);
                  },
                  icon: const Icon(Icons.share),
                ),
              ]
            : null,

        // actions: news.url ! = null
        // ? [
        //   IconButton(
        //     onPressed: () {
        //     Share.share(news.url!);
        //     },
        //     icon: const Icon(Icons.share),
        //   ),
        // ] : null
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 0),
        children: [
          SecondTitle(news: news),
          const Dividerr(),
          TimeDay(time: time),
          const SizedBox(
            height: 20,
          ),
          Images(news: news),
          const SizedBox(
            height: 18,
          ),
          AboutNews(news: news),
          const SizedBox(
            height: 25,
          ),
          news.url != null
              ? ReadMore(
                  onPressed: () async {
                    final uri = Uri.parse(news.url!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
