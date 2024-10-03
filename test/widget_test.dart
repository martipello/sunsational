// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sunsational/app.dart';

import 'package:sunsational/main.dart';
import 'package:sunsational/navigation/navigation_config.dart';
import 'package:sunsational/ui/dashboard_page.dart';

import 'test_app.dart';

void main() {
  testWidgets('Opens the test app', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final appRouter = router(initialRoute: kDashboardRoute);
    await tester.pumpWidget(testApp(appRouter));
    await tester.pump();
    expect(find.byType(Dashboard), findsOneWidget);
  });
}
