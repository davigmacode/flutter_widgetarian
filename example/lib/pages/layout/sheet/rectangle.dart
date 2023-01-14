import 'package:flutter/material.dart' hide Overlay;
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class SheetRectangleUsage extends StatelessWidget {
  const SheetRectangleUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Sample(
      title: 'Rectangle Shape',
      script: script,
      children: [
        TonalSheet.square(
          size: 100,
          child: Center(child: Text('Tonal')),
        ),
        ElevatedSheet.square(
          size: 100,
          child: Center(child: Text('Elevated')),
        ),
        FilledSheet.square(
          size: 100,
          child: Center(child: Text('Filled')),
        ),
        OutlinedSheet.square(
          size: 100,
          child: Center(child: Text('Outlined')),
        ),
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    TonalSheet.square(
      size: 100,
      child: Center(child: Text('Tonal')),
    ),
    ElevatedSheet.square(
      size: 100,
      child: Center(child: Text('Elevated')),
    ),
    FilledSheet.square(
      size: 100,
      child: Center(child: Text('Filled')),
    ),
    OutlinedSheet.square(
      size: 100,
      child: Center(child: Text('Outlined')),
    ),
  ],
)''';
