import 'package:flutter/material.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class TileTextUsage extends StatelessWidget {
  const TileTextUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.primaryContainer;
    final fgColor = Theme.of(context).colorScheme.onPrimaryContainer;
    return Sample(
      title: 'Text Tile',
      script: script,
      children: [
        DefaultTextStyle(
          style: TextStyle(
            backgroundColor: bgColor,
            color: fgColor,
          ),
          child: const TextTile(
            title: Text('Title'),
            subtitle: Text('Subtitle'),
            spacing: 3,
            align: TextTileAlign.right,
          ),
        ),
      ],
    );
  }
}

const script = '''DefaultTextStyle(
  style: TextStyle(
    backgroundColor: bgColor,
    color: fgColor,
  ),
  child: const TextTile(
    title: Text('Title'),
    subtitle: Text('Subtitle'),
    spacing: 3,
    align: TextTileAlign.right,
  ),
)''';
