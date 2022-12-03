import 'package:flutter/material.dart';

import '../template.dart';
import 'basic.dart';

class TextPage extends StatefulWidget {
  const TextPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const [
          TextConstrainedUsage(),
        ],
      ),
    );
  }
}
