import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';

import 'package:ny_times_popular_articles/utils/api.dart';
import 'package:ny_times_popular_articles/models/article_model.dart';
import 'package:ny_times_popular_articles/services/article_service.dart';
import 'article_service_test.mocks.dart';

// prepare ArticleService instance
final ArticleService articleService = ArticleService();
final client = MockClient();

// ArticleService Unit Test
@GenerateMocks([http.Client])
void main() {
  group('Article Service Tests', () {
    test('Fetch articles with status 200', () async {
      String res =
          '{"results": [{"id": 1, "title": "Test Title 1", "byline": "Author", "section": "Test Section", "abstract": "Test Abstract","published_date": "2021-12-21","media": [{"type": "image", "media-metadata": [{"url": "https://www.thumbnail.com"}, {"url": "https://www.medium.com"}, {"url": "https://www.image.com"}]}]}]}';

      when(client.get(Uri.parse(APIUrl.popularArticlesPath)))
          .thenAnswer((_) async => http.Response(res, 200));

      expect(await articleService.getPopularArticles(client),
          isA<List<Article>>());
    });

    test(
        'Fetch articles with status 200 with media-metadata empty or less than 3',
        () async {
      String res =
          '{"results": [{"id": 1, "title": "Test Title 1", "byline": "Author", "section": "Test Section", "abstract": "Test Abstract","published_date": "2021-12-21","media": [{"type": "image", "media-metadata": []}]}]}';

      when(client.get(Uri.parse(APIUrl.popularArticlesPath)))
          .thenAnswer((_) async => http.Response(res, 200));

      List<Article> articles = await articleService.getPopularArticles(client);

      expect(articles, isA<List<Article>>());
      expect(articles[0].thumbnail == null, true);
      expect(articles[0].imagePath == null, true);
    });

    test('Fetch articles with status 200 without media-metadata', () async {
      String res =
          '{"results": [{"id": 1, "title": "Test Title 1", "byline": "Author", "section": "Test Section", "abstract": "Test Abstract","published_date": "2021-12-21","media": [{"type": "image"}]}]}';

      when(client.get(Uri.parse(APIUrl.popularArticlesPath)))
          .thenAnswer((_) async => http.Response(res, 200));

      List<Article> articles = await articleService.getPopularArticles(client);

      expect(articles, isA<List<Article>>());
      expect(articles[0].thumbnail == null, true);
      expect(articles[0].imagePath == null, true);
    });

    test('Fetch articles with status 200 without media', () async {
      String res =
          '{"results": [{"id": 1, "title": "Test Title 1", "byline": "Author", "section": "Test Section", "abstract": "Test Abstract","published_date": "2021-12-21"}]}';

      when(client.get(Uri.parse(APIUrl.popularArticlesPath)))
          .thenAnswer((_) async => http.Response(res, 200));

      expect(await articleService.getPopularArticles(client),
          isA<List<Article>>());
    });

    test('Fetch articles from API with status 401 (Invalid API Key)', () async {
      String res =
          '{"fault":{"faultstring":"Invalid ApiKey","detail":{"errorcode":"oauth.v2.InvalidApiKey"}}}';

      when(client.get(Uri.parse(APIUrl.popularArticlesPath)))
          .thenAnswer((_) async => http.Response(res, 401));

      expect(articleService.getPopularArticles(client), throwsException);
    });

    test('Fetch articles from API with status 500 (Server error)', () async {
      when(client.get(Uri.parse(APIUrl.popularArticlesPath)))
          .thenAnswer((_) async => http.Response('Internal Server Error', 500));

      expect(articleService.getPopularArticles(client), throwsException);
    });
  });
}
