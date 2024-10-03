import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunsational/extensions/context_extensions.dart';

import '../ui/dashboard_page.dart';
import '../ui/detail_page.dart';

final rootNavigator = GlobalKey<NavigatorState>();

GoRouter router({String? initialRoute}) => GoRouter(
      debugLogDiagnostics: true,
      observers: [HeroController()],
      navigatorKey: rootNavigator,
      initialLocation: initialRoute ?? kDashboardRoute,
      routes: [
        GoRoute(
          path: kDashboardRoute,
          name: kDashboardName,
          builder: (context, state) {
            return const Dashboard();
          },
        ),
        GoRoute(
          path: kDetailPageRoute,
          name: kDetailPageName,
          pageBuilder: (context, state) => const NoTransitionPage(
            child: DetailPage(),
          ),
        ),
      ],
      redirect: (context, state) async {
        return null;
      },
      errorBuilder: (context, __) {
        return Material(
          child: Center(
            child: Text(
              'Sorry this page doesn\'t exist',
              style: context.text.bodyLarge,
            ),
          ),
        );
      },
    );
