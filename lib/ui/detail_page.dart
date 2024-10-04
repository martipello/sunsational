import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunsational/ui/widgets/theme_button.dart';

const kDetailPageName = 'Detail';
const kDetailPageRoute = '/detail';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();

  static navigate(BuildContext context) {
    context.push(kDetailPageRoute);
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(kDetailPageName),
          actions: const [
            ThemeButton(),
          ],
        ),
        body: const Placeholder(),
      ),
    );
  }
}
