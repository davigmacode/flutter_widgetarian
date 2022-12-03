import 'package:flutter/material.dart';

import '../../template.dart';
import 'single.dart';
import 'multiple.dart';

class ChoiceBasicPage extends StatefulWidget {
  const ChoiceBasicPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<ChoiceBasicPage> createState() => _ChoiceBasicPageState();
}

class _ChoiceBasicPageState extends State<ChoiceBasicPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
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
