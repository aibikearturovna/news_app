import 'package:flutter/material.dart';
import 'package:news_app/components/first_card.dart';
import 'package:news_app/constants/country.dart';
import 'package:news_app/constants/text.dart';
import 'package:news_app/models/topnews.dart';
import 'package:news_app/services/fetch.dart';
import 'package:news_app/theme/colors.dart';
import 'package:news_app/views/search.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TopNews? topNews;

  Future<void> fetchNew([String? domain]) async {
    topNews = null;
    setState(() {});
    topNews = await NewsRepo().fetchData(domain);
    setState(() {});
  }

  @override
  void initState() {
    fetchNew();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        title: const Text(AppText.title),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.more_vert),
              onSelected: (Country value) async {
                await fetchNew(value.domain);
              },
              itemBuilder: (context) {
                return countriesSet
                    .map(
                      (e) => PopupMenuItem<Country>(
                        value: e,
                        child: Text(e.name),
                      ),
                    )
                    .toList();
              })
        ],
      ),
      body: topNews == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: topNews!.articles.length,
              itemBuilder: (context, index) {
                final news = topNews!.articles[index];
                return MainCard(news: news);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchNews(),
              ));
        },
        backgroundColor: AppColors.button,
        child: const Icon(Icons.search),
      ),
    );
  }
}
