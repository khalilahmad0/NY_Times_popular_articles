import 'package:flutter/material.dart';
import 'package:ny_times_popular_articles/models/article_model.dart';
import 'package:ny_times_popular_articles/utils/constants.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({required this.article, Key? key}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.articleDetailTitle),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              article.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          article.imagePath != null
              ? Image(image: NetworkImage(article.imagePath!))
              : Container(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(article.abstract ?? ''),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  article.author,
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Constants.subtitleColor),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.today,
                      color: Constants.subtitleColor,
                      size: 20,
                    ),
                    Text(
                      article.publishDate ?? '',
                      style: const TextStyle(color: Constants.subtitleColor),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
