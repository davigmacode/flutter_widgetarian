import 'package:flutter/material.dart';

import '../template.dart';
import 'constrained.dart';

class TextPage extends StatelessWidget {
  const TextPage({
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
          TextConstrainedUsage(),
        ],
      ),
    );
  }
}
