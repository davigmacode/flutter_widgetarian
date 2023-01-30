import 'package:flutter/material.dart';

import '../../template.dart';
import 'basic.dart';
import 'severity.dart';
import 'child.dart';
import 'event.dart';
import 'icon.dart';
import 'block.dart';
import 'loading.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({
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
          ButtonBasicUsage(),
          ButtonSeverityUsage(),
          ButtonChildUsage(),
          ButtonEventUsage(),
          ButtonIconUsage(),
          ButtonBlockUsage(),
          ButtonLoadingUsage(),
        ],
      ),
    );
  }
}
