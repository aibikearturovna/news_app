class ApiLink {
  static const apiKey = '2fb59cb1a02a4850962d7906a06245a9';
  static String topNews([String? domain]) =>
      'https://newsapi.org/v2/top-headlines?country=${domain ?? 'us'}&apiKey=$apiKey';

  static String searchNews(String text) =>
      'https://newsapi.org/v2/everything?q=$text&apiKey=$apiKey';

  static const String image =
      'https://previews.123rf.com/images/alhovik/alhovik1709/alhovik170900031/86481591-breaking-news-background-world-global-tv-news-banner-design.jpg';
// 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpBAZafcETIewM5tuVRKUWoqpVNB5CKrIbGzOIB8IxWx40WQ2DK2MDkmbEin9_mu1K54Y&usqp=CAU';
}
