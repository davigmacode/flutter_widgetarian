import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/button.dart';

import '../sample.dart';

class ButtonBasicUsage extends StatelessWidget {
  const ButtonBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Button Variant',
      script: script,
      children: [
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.text(),
          child: const Text('Text Button'),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.tonal(),
          child: const Text('Tonal Button'),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.outlined(),
          child: const Text('Outlined Button'),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.filled(),
          child: const Text('Filled Button'),
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
      onPressed: () {},
      style: DrivenButtonStyle.text(),
      child: const Text('Text Button'),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.tonal(),
      child: const Text('Tonal Button'),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.outlined(),
      child: const Text('Outlined Button'),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.filled(),
      child: const Text('Filled Button'),
    ),
  ],
)''';
