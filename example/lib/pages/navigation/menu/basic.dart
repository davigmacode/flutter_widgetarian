import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/navigation.dart';

import '../../sample.dart';

class MenuBasicUsage extends StatelessWidget {
  const MenuBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        SizedBox(
          width: 500,
          child: Menu(
            items: {
              '/': MenuLeaf(
                name: 'Home',
                builder: (context) => const Text('Home'),
              ),
              '/button': MenuLeaf(
                name: 'Button',
                builder: (context) => const Text('Button'),
              ),
            },
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
