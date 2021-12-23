import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ny_times_popular_articles/controllers/article_controller.dart';
import 'package:ny_times_popular_articles/models/article_model.dart';
import 'package:ny_times_popular_articles/services/article_service.dart';
import 'package:ny_times_popular_articles/views/article_item.dart';
import 'package:ny_times_popular_articles/widgets/loading_widget.dart';

class ArticlesListScreen extends StatefulWidget {
  const ArticlesListScreen({Key? key}) : super(key: key);

  @override
  _ArticlesListScreenState createState() => _ArticlesListScreenState();
}

class _ArticlesListScreenState extends State<ArticlesListScreen> {
  ArticleController articleController =
      ArticleController(articleService: ArticleService(), client: Client());

  Future loadData() async {
    try {
      await articleController.getArticles();
      return articleController.popularArticles;
    } catch (err) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loading();
          } else if (snapshot.connectionState == ConnectionState.done &&
              !snapshot.hasError) {
            final articles = (snapshot.data ?? <Article>[]) as List<Article>;

            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(10, 15, 5, 15),
              itemCount: articles.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return ArticleItem(
                  article: articles[index],
                );
              },
            );
          }
          return WillPopScope(
            onWillPop: () => Future.value(false),
            child: AlertDialog(
              title: Row(
                children: const [
                  Icon(Icons.error),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Error'),
                ],
              ),
              content: Text('${snapshot.error}'.replaceAll('Exception: ', '')),
              actions: <Widget>[
                TextButton(
                  child: const Text('Retry'),
                  onPressed: () {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
          );
        });
  }
}
