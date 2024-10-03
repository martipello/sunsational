import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sunsational/extensions/context_extensions.dart';
import 'package:sunsational/ui/detail_page.dart';

import '../services/theme_service.dart';

const kDashboardName = 'Dashboard';
const kDashboardRoute = '/dashboard';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.strings.app_name),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: FilledButton(
                onPressed: () {
                  DetailPage.navigate(context);
                },
                child: Text('Details'),
              ),
            ),
            Center(
              child: FilledButton(
                onPressed: () {
                  final isDarkMode = context.isDarkMode;
                  context.themeService.setDarkMode(isDarkMode: !isDarkMode);
                },
                child: Text('Theme'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
