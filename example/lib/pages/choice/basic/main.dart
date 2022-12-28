import 'package:flutter/material.dart';

import '../../template.dart';
import 'single.dart';
import 'multiple.dart';

class ChoiceBasicPage extends StatelessWidget {
  const ChoiceBasicPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const [
          ChoiceBasicSingleUsage(),
          ChoiceBasicMultipleUsage(),
        ],
      ),
    );
  }
}
