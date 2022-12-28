import 'package:flutter/material.dart';

import '../../template.dart';
import 'basic.dart';
import 'text.dart';
import 'list.dart';

class TilePage extends StatelessWidget {
  const TilePage({
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
          TileBasicUsage(),
          TileTextUsage(),
          TileListUsage(),
        ],
      ),
    );
  }
}
