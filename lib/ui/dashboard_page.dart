import 'package:flutter/material.dart';
import 'package:sunsational/extensions/context_extensions.dart';
import 'package:sunsational/ui/widgets/theme_button.dart';

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
          actions: const [
            ThemeButton(),
          ],
        ),
        body: Container(),
      ),
    );
  }

}
