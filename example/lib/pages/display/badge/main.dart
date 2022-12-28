import 'package:flutter/material.dart';

import '../../template.dart';
import 'basic.dart';
import 'animated.dart';

class BadgePage extends StatelessWidget {
  const BadgePage({
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
          BadgeBasicUsage(),
          BadgeAnimatedUsage(),
        ],
      ),
    );
  }
}
