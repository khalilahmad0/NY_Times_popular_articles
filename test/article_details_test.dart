import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_popular_articles/models/article_model.dart';
import 'package:ny_times_popular_articles/views/article_detail.dart';
import 'package:network_image_mock/network_image_mock.dart';

// initiate Article Items
Widget missingArticleItemWidget = MaterialApp(
  home: Material(
    child: ArticleDetail(
        article: Article(
      id: 1,
      title: 'Title',
      author: 'Author',
    )),
  ), // only required fields
);

Widget fullArticleItemWidget = MaterialApp(
  home: Material(
    child: ArticleDetail(
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
  group('Article Details Tests', () {
    testWidgets('Missing Fields Test', (WidgetTester tester) async {
      // Use this to avoid HttpClient error (mock network images)
      mockNetworkImagesFor(
          () => tester.pumpWidget(missingArticleItemWidget).then((value) {
                // Widget Tests
                expect(find.byType(Text), findsNWidgets(5));
                expect(find.byType(Icon), findsOneWidget);
                expect(find.byType(Image), findsNothing);
                // Text tests
                expect(find.text('Title'), findsOneWidget);
                expect(find.text('Author'), findsOneWidget);
                expect(find.text('Abstract'), findsNothing);
                expect(find.text('Date'), findsNothing);
              }));
    });

    testWidgets('Complete Fields Test', (WidgetTester tester) async {
      // Use this to avoid HttpClient error (mock network images)
      mockNetworkImagesFor(
          () => tester.pumpWidget(fullArticleItemWidget).then((value) {
                // Widget Tests
                expect(find.byType(Text), findsNWidgets(5));
                expect(find.byType(Icon), findsOneWidget);
                expect(find.byType(Image), findsOneWidget);
                // Text tests
                expect(find.text('Title'), findsOneWidget);
                expect(find.text('Author'), findsOneWidget);
                expect(find.text('Abstract'), findsOneWidget);
                expect(find.text('Date'), findsOneWidget);
              }));
    });
  });
}
