import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
        ),
        body: const Placeholder(),
      ),
    );
  }
}
