import 'package:flutter/material.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/typography.dart';
import 'menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                const Gap(20),
                HeadlineText.large(title),
                const Gap(20),
                const PageMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
