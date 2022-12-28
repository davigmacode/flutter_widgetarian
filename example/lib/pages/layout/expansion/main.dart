import 'package:flutter/material.dart';

import '../../template.dart';
import 'panel.dart';
import 'text.dart';
import 'menu.dart';

class ExpansionPage extends StatelessWidget {
  const ExpansionPage({
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
          ExpansionPanelUsage(),
          ExpansionTextUsage(),
          ExpansionMenuUsage(),
        ],
      ),
    );
  }
}
