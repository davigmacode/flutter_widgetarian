import 'package:flutter/material.dart' hide Overlay;
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class SheetCircleUsage extends StatelessWidget {
  const SheetCircleUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Sample(
      title: 'Circle Shape',
      script: script,
      children: [
        Sheet.circle(
          radius: 50,
          child: Center(child: Text('Text')),
        ),
        TonalSheet.circle(
          radius: 50,
          child: Center(child: Text('Tonal')),
        ),
        ElevatedSheet.circle(
          radius: 50,
          child: Center(child: Text('Elevated')),
        ),
        FilledSheet.circle(
          radius: 50,
          child: Center(child: Text('Filled')),
        ),
        OutlinedSheet.circle(
          radius: 50,
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
    TonalSheet.circle(
      radius: 50,
      child: Center(child: Text('Tonal')),
    ),
    ElevatedSheet.circle(
      radius: 50,
      child: Center(child: Text('Elevated')),
    ),
    FilledSheet.circle(
      radius: 50,
      child: Center(child: Text('Filled')),
    ),
    OutlinedSheet.circle(
      radius: 50,
      child: Center(child: Text('Outlined')),
    ),
  ],
)''';
