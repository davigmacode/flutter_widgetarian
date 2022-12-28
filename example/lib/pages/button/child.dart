import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/button.dart';

import '../sample.dart';

class ButtonChildUsage extends StatelessWidget {
  const ButtonChildUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Button Children',
      script: script,
      children: [
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.text(),
          leading: const Icon(Icons.calendar_month),
          child: const Text('Text Button'),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.tonal(),
          trailing: const Icon(Icons.close),
          child: const Text('Tonal Button'),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.outlined(),
          leading: const Icon(Icons.calendar_month),
          trailing: const Icon(Icons.close),
          child: const Text('Outlined Button'),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.filled(),
          leading: const SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(),
          ),
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
      leading: const Icon(Icons.calendar_month),
      child: const Text('Text Button'),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.tonal(),
      trailing: const Icon(Icons.close),
      child: const Text('Tonal Button'),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.outlined(),
      leading: const Icon(Icons.calendar_month),
      trailing: const Icon(Icons.close),
      child: const Text('Outlined Button'),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.filled(),
      leading: const SizedBox.square(
        dimension: 18,
        child: CircularProgressIndicator(),
      ),
      child: const Text('Filled Button'),
    ),
  ],
)''';
