import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:ny_times_popular_articles/utils/api.dart';
import 'package:ny_times_popular_articles/models/article_model.dart';
import 'package:ny_times_popular_articles/utils/constants.dart';

class ArticleService {
  Future<List<Article>> getPopularArticles(Client client) async {
    try {
      final Response response =
          await client.get(Uri.parse(APIUrl.popularArticlesPath));

      final Map<String, dynamic> responseData = json.decode(response.body);

      // Success
      if (response.statusCode == 200) {
        List<Article> articles = List.from(responseData['results']
            .map((article) => Article.fromJson(article))
            .toList());
        return articles;
      } else if (response.statusCode == 500) {
        throw Exception(Constants.serverErrorMsg); // Server Error
      } else {
        throw Exception(responseData['fault']['faultstring']); // API Error
      }
    } on SocketException catch (_) {
      throw Exception('No Internet Connection'); // No connection
    } catch (err) {
      throw Exception('Unknown Error has occurred'); // Unknown error
    }
  }
}
