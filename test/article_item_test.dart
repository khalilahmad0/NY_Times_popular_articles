import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_popular_articles/models/article_model.dart';
import 'package:ny_times_popular_articles/views/article_item.dart';
import 'package:network_image_mock/network_image_mock.dart';

// initiate Article Items
Widget missingArticleItemWidget = MaterialApp(
  home: Material(
    child: ArticleItem(
        article: Article(
      id: 1,
      title: 'Title',
      author: 'Author',
    )),
  ), // only required fields
);

Widget fullArticleItemWidget = MaterialApp(
  home: Material(
    child: ArticleItem(
      article: Article(
          id: 2,
          title: 'Title',
          author: 'Author',
          section: 'Section',
          abstract: 'Abstract',
          publishDate: 'Date',
          thumbnail: 'Thumbnail',
          imagePath: 'ImagePath'), // All fields
    ),
  ),
);

void main() {
  group('Article Item Tests', () {
    testWidgets("Missing Fields Test", (WidgetTester tester) async {
      // Use this to avoid HttpClient error (mock network images)
      mockNetworkImagesFor(
          () => tester.pumpWidget(missingArticleItemWidget).then((value) {
                // Widget Tests
                expect(find.byType(Text), findsNWidgets(4));
                expect(find.byType(Icon), findsNWidgets(2));
                expect(find.byType(IconButton), findsOneWidget);
                expect(find.byType(CircleAvatar), findsOneWidget);
                expect(find.byType(NetworkImage), findsNothing);
                // Text tests
                expect(find.text('Title'), findsOneWidget);
                expect(find.text('Author'), findsOneWidget);
                expect(find.text('Section'), findsNothing);
                expect(find.text('Date'), findsNothing);
              }));
    });

    testWidgets("Complete Fields Test", (WidgetTester tester) async {
      // Use this to avoid HttpClient error (mock network images)
      mockNetworkImagesFor(
          () => tester.pumpWidget(fullArticleItemWidget).then((value) {
                // Widget Tests
                expect(find.byType(Text), findsNWidgets(4));
                expect(find.byType(Icon), findsNWidgets(2));
                expect(find.byType(IconButton), findsOneWidget);
                expect(find.byType(CircleAvatar), findsOneWidget);
                expect(find.byType(NetworkImage), findsNothing);
                // Text tests
                expect(find.text('Title'), findsOneWidget);
                expect(find.text('Author'), findsOneWidget);
                expect(find.text('Section'), findsOneWidget);
                expect(find.text('Date'), findsOneWidget);
              }));
    });
  });
}
