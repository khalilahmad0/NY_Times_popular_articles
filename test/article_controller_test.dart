import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_popular_articles/controllers/article_controller.dart';

import 'package:ny_times_popular_articles/models/article_model.dart';
import 'package:ny_times_popular_articles/services/article_service.dart';
import 'article_controller_test.mocks.dart';

// prepare instances
final ArticleService articleService = MockArticleService();
final client = Client();
final articleController =
    ArticleController(articleService: articleService, client: client);

// ArticleController Unit Test
@GenerateMocks([ArticleService])
void main() {
  group("ArticleController Tests", () {
    test("Call ArticleController with valid articles", () async {
      List<Article> testArticles = [
        Article(id: 1, title: 'First Article', author: 'First Author'),
        Article(id: 2, title: 'Second Article', author: 'Second Author'),
        Article(id: 3, title: 'Third Article', author: 'Third Author'),
      ];
      when(articleService.getPopularArticles(client)).thenAnswer(
        (_) => Future.value(testArticles),
      );

      await articleController.getArticles();

      expect(articleController.popularArticles[0].id, 1);
      expect(articleController.popularArticles[1].title, 'Second Article');
      expect(articleController.popularArticles[2].author, 'Third Author');
    });

    test("Call ArticleController with an empty list", () async {
      List<Article> testArticles = [];
      when(articleService.getPopularArticles(client)).thenAnswer(
        (_) => Future.value(testArticles),
      );

      await articleController.getArticles();

      expect(articleController.popularArticles.isEmpty, true);
    });
  });
}
