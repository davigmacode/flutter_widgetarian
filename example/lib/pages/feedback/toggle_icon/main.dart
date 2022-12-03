import 'package:flutter/material.dart';

import '../../template.dart';
import 'basic.dart';

class ToggleIconPage extends StatefulWidget {
  const ToggleIconPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<ToggleIconPage> createState() => _ToggleIconPageState();
}

class _ToggleIconPageState extends State<ToggleIconPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const [
          ToggleIconBasicUsage(),
        ],
      ),
    );
  }
}
