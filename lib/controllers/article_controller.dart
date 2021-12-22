import 'package:ny_times_popular_articles/models/article_model.dart';
import 'package:ny_times_popular_articles/services/article_service.dart';
import 'package:http/http.dart';

class ArticleController {
  final ArticleService articleService;
  final Client client;
  List<Article> popularArticles = [];

  ArticleController({required this.articleService, required this.client});

  Future<void> getArticles() async {
    popularArticles = await articleService.getPopularArticles(client);
  }
}
