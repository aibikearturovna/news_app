import 'package:flutter/material.dart';
import 'package:news_app/components/first_card.dart';
import 'package:news_app/models/topnews.dart';
import 'package:news_app/services/fetch.dart';
import 'package:news_app/theme/colors.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({Key? key}) : super(key: key);

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  TopNews? topNews;
  bool isSearch = false;
  final controller = TextEditingController();

  Future<void> fetchData(String text) async {
    isSearch = true;
    setState(() {});
    topNews = await NewsRepo().fetchSearch(text);
    isSearch = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        title: TextField(
          controller: controller,
          onChanged: (value) async {
            await fetchData(value);
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await fetchData(controller.text);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    if (isSearch) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (isSearch == false && topNews != null) {
      return ListView.builder(
        itemCount: topNews!.articles.length,
        itemBuilder: (context, index) {
          final news = topNews!.articles[index];
          return MainCard(news: news);
        },
      );
    } else {
      return const Center(
        child: Text('Search'),
      );
    }
  }
}
