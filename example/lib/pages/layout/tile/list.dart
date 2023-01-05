import 'package:flutter/material.dart' hide ListTile;
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class TileListUsage extends StatelessWidget {
  const TileListUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.primaryContainer;
    final fgColor = Theme.of(context).colorScheme.onPrimaryContainer;
    return Sample(
      title: 'List Tile',
      script: script,
      children: [
        DefaultTextStyle(
          style: TextStyle(
            backgroundColor: bgColor,
            color: fgColor,
          ),
          child: const SizedBox(
            width: 200,
            child: ListTile(
              title: Text('title'),
              subtitle: Text('subtitle'),
              leading: Text('leading'),
              trailing: Text('trailing'),
              spacing: 10,
            ),
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
  child: const SizedBox(
    width: 200,
    child: ListTile(
      title: Text('title'),
      subtitle: Text('subtitle'),
      leading: Text('leading'),
      trailing: Text('trailing'),
      spacing: 10,
    ),
  ),
)''';
