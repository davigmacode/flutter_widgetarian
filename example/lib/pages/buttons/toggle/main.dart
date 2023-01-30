import 'package:flutter/material.dart';

import '../../template.dart';
import 'basic.dart';
import 'severity.dart';
import 'icon.dart';
import 'block.dart';

class ToggleButtonPage extends StatelessWidget {
  const ToggleButtonPage({
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
          ToggleButtonBasicUsage(),
          ToggleButtonSeverityUsage(),
          ToggleButtonIconUsage(),
          ToggleButtonBlockUsage(),
        ],
      ),
    );
  }
}
