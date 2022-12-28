import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/button.dart';

import '../sample.dart';

class ButtonBlockUsage extends StatelessWidget {
  const ButtonBlockUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Block Button',
      script: script,
      children: [
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.text().block(),
          child: const Text('Text Button'),
        ),
        Button.block(
          onPressed: () {},
          style: DrivenButtonStyle.tonal(),
          trailing: const Icon(Icons.close),
          child: const Text('Tonal Button'),
        ),
        Button.block(
          expanded: false,
          justifyChildren: MainAxisAlignment.spaceBetween,
          onPressed: () {},
          style: DrivenButtonStyle.outlined(),
          leading: const Icon(Icons.calendar_month),
          trailing: const Icon(Icons.close),
          child: const Text('Outlined Button'),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.filled().block(expanded: false),
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

const script = '''Column(
  children: [
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.text().block(),
      child: const Text('Text Button'),
    ),
    Button.block(
      onPressed: () {},
      style: DrivenButtonStyle.tonal(),
      trailing: const Icon(Icons.close),
      child: const Text('Tonal Button'),
    ),
    Button.block(
      expanded: false,
      justifyChildren: MainAxisAlignment.spaceBetween,
      onPressed: () {},
      style: DrivenButtonStyle.outlined(),
      leading: const Icon(Icons.calendar_month),
      trailing: const Icon(Icons.close),
      child: const Text('Outlined Button'),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.filled().block(expanded: false),
      leading: const SizedBox.square(
        dimension: 18,
        child: CircularProgressIndicator(),
      ),
      child: const Text('Filled Button'),
    ),
  ],
)''';
