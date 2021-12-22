import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ny_times_popular_articles/utils/constants.dart';
import 'package:ny_times_popular_articles/widgets/loading_widget.dart';

// initiate loading widget
Widget loadingWidget = const MaterialApp(
  home: Loading(),
);

void main() {
  group('LoadingWidget Tests', () {
    testWidgets("Circular indicator test", (WidgetTester tester) async {
      await tester.pumpWidget(loadingWidget);

      var circularIndicator = find.byType(CircularProgressIndicator);
      expect(circularIndicator, findsOneWidget);
    });

    testWidgets("SizedBox test", (WidgetTester tester) async {
      await tester.pumpWidget(loadingWidget);

      var sizedBox = find.byType(SizedBox);
      expect(sizedBox, findsOneWidget);
    });

    testWidgets("Loading text test", (WidgetTester tester) async {
      await tester.pumpWidget(loadingWidget);

      var loadingTextWidget = find.byType(Text);
      var loadingText = find.text(Constants.loadingMsg);
      expect(loadingTextWidget, findsOneWidget);
      expect(loadingText, findsOneWidget);
    });
  });
}
