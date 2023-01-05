import 'package:flutter/material.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class TileBasicUsage extends StatelessWidget {
  const TileBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.primaryContainer;
    final fgColor = Theme.of(context).colorScheme.onPrimaryContainer;

    return Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        DefaultTextStyle(
          style: TextStyle(
            backgroundColor: bgColor,
            color: fgColor,
          ),
          child: const Tile(
            spacing: 10,
            leading: Text('Leading'),
            trailing: Text('Trailing'),
            child: Text('Horizontal Tile'),
          ),
        ),
        DefaultTextStyle(
          style: TextStyle(
            backgroundColor: bgColor,
            color: fgColor,
          ),
          child: const Tile(
            spacing: 3,
            direction: Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            leading: Text('Leading'),
            trailing: Text('Trailing'),
            child: Text('Vertical Tile'),
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
    DefaultTextStyle(
      style: TextStyle(
        backgroundColor: bgColor,
        color: fgColor,
      ),
      child: const Tile(
        spacing: 10,
        leading: Text('Leading'),
        trailing: Text('Trailing'),
        child: Text('Horizontal Tile'),
      ),
    ),
    DefaultTextStyle(
      style: TextStyle(
        backgroundColor: bgColor,
        color: fgColor,
      ),
      child: const Tile(
        spacing: 3,
        direction: Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        leading: Text('Leading'),
        trailing: Text('Trailing'),
        child: Text('Vertical Tile'),
      ),
    ),
  ],
)''';
