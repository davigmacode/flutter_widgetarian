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

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    Button(
      onPressed: () => {},
      style: ButtonStyle.flat(),
      child: const Text('Flat Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.toned(),
      child: const Text('Toned Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.outlined(),
      child: const Text('Outlined Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.filled(),
      child: const Text('Filled Button'),
    ),
  ],
)''';
