import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/constants/api.dart';
import 'package:news_app/models/topnews.dart';

class NewsRepo {
  final http.Client client = http.Client();

  Future<TopNews?> fetchData([String? domain]) async {
    final uri = Uri.parse(ApiLink.topNews(domain));

    final response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final topNews = TopNews.fromJson(data);
      return topNews;
    }
    return null;
  }

  Future<TopNews?> fetchSearch(String text) async {
    final uri = Uri.parse(ApiLink.searchNews(text));

    final response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      final topNews = TopNews.fromJson(data);
      return topNews;
    }
    return null;
  }
}
