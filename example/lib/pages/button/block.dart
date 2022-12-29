import 'package:flutter/material.dart'
    hide ButtonStyle, TextButton, OutlinedButton;
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
        TextButton.block(
          onPressed: () {},
          child: const Text('Text Button'),
        ),
        TonalButton.block(
          onPressed: () {},
          trailing: const Icon(Icons.close),
          child: const Text('Tonal Button'),
        ),
        OutlinedButton.block(
          expanded: false,
          justifyChildren: MainAxisAlignment.spaceBetween,
          onPressed: () {},
          leading: const Icon(Icons.calendar_month),
          trailing: const Icon(Icons.close),
          child: const Text('Outlined Button'),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.filled().block(expanded: false),
          leading: const SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          child: const Text('Filled Button'),
        ),
      ],
    );
  }
}

const script = '''Column(
  children: [
    TextButton.block(
      onPressed: () {},
      child: const Text('Text Button'),
    ),
    TonalButton.block(
      onPressed: () {},
      trailing: const Icon(Icons.close),
      child: const Text('Tonal Button'),
    ),
    OutlinedButton.block(
      expanded: false,
      justifyChildren: MainAxisAlignment.spaceBetween,
      onPressed: () {},
      leading: const Icon(Icons.calendar_month),
      trailing: const Icon(Icons.close),
      child: const Text('Outlined Button'),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.filled().block(expanded: false),
      leading: const SizedBox.square(
        dimension: 18,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      child: const Text('Filled Button'),
    ),
  ],
)''';
