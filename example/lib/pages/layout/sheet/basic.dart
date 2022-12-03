import 'package:flutter/material.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class SheetBasicUsage extends StatelessWidget {
  const SheetBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        Sheet(
          style: const SheetStyle().filled(
            elevation: 5,
            width: 100,
            height: 100,
          ),
          child: const Center(child: Text('Elevated')),
        ),
        Sheet(
          style: const SheetStyle().outlined(
            borderRadius: BorderRadius.zero,
            width: 100,
            height: 100,
          ),
          child: const Center(child: Text('Outlined')),
        ),
        Sheet(
          style: const SheetStyle().toned(
            shape: BoxShape.circle,
            width: 100,
            height: 100,
          ),
          child: const Center(child: Text('Toned')),
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
