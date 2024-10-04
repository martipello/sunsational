// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sunsational/di/dependency_injection_container.dart' as di;
import 'package:sunsational/navigation/navigation_config.dart';
import 'package:sunsational/ui/dashboard_page.dart';
import 'package:sunsational/ui/detail_page.dart';

import 'test_app.dart';

void main() {
  testWidgets('Opens the test app', (WidgetTester tester) async {
    await di.init();
    final appRouter = router(initialRoute: kDashboardRoute);
    await tester.pumpWidget(testApp(appRouter));
    await tester.pump();
    expect(find.byType(Dashboard), findsOneWidget);
  });

  testWidgets('Checks form validation', (tester) async {
    await di.init();
    final appRouter = router(initialRoute: kDashboardRoute);
    await tester.pumpWidget(testApp(appRouter));
    await tester.pump();
    expect(find.byType(Dashboard), findsOneWidget);
    final locationField = find.byType(TextFormField);
    expect(locationField, findsOneWidget);
    await tester.enterText(locationField, 'New York');
    await tester.pump();
    await tester.enterText(locationField, '');
    await tester.pumpAndSettle();
    expect(find.text('Please enter your location'), findsOneWidget);
    await tester.enterText(locationField, 'New York');
    await tester.pump();
    final submitButton = find.byTooltip('Submit');
    await tester.tap(submitButton);
    await tester.pump();
    expect(find.text('Enter your location'), findsNothing);
    expect(find.byType(DetailPage), findsOneWidget);
  });
}
