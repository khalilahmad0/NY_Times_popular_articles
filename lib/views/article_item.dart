import 'package:flutter/material.dart';
import 'package:ny_times_popular_articles/models/article_model.dart';
import 'package:ny_times_popular_articles/utils/constants.dart';

import 'article_detail.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({required this.article, Key? key}) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.12,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                NetworkImage(article.thumbnail ?? Constants.defaultThumbnail),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  article.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      article.author,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Constants.subtitleColor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            article.section ?? '',
                            style:
                                const TextStyle(color: Constants.subtitleColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Expanded(
                            child: Row(
                          children: [
                            const Icon(
                              Icons.today,
                              size: 20,
                              color: Constants.subtitleColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              article.publishDate ?? '',
                              style: const TextStyle(
                                color: Constants.subtitleColor,
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ArticleDetail(
                      article: article,
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Constants.subtitleColor,
              ))
        ],
      ),
    );
  }
}
