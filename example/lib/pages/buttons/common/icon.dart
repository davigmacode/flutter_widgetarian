import 'package:flutter/material.dart'
    hide ButtonStyle, TextButton, FilledButton, ElevatedButton, OutlinedButton;
import 'package:widgetarian/button.dart';

import '../../sample.dart';

class ButtonIconUsage extends StatelessWidget {
  const ButtonIconUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Icon Button',
      script: script,
      children: [
        TextButton.icon(
          onPressed: () {},
          child: const Icon(Icons.settings),
        ),
        TonalButton.icon(
          onPressed: () {},
          shape: BoxShape.rectangle,
          child: const Icon(Icons.settings),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          child: const Icon(Icons.settings),
        ),
        FilledButton.icon(
          onPressed: () {},
          pressedStyle: ButtonStyle(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5),
          ),
          child: const Icon(Icons.settings),
        ),
        Button(
          onPressed: () {},
          style: const DrivenButtonStyle.outlined(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            hoveredStyle: ButtonStyle(shape: BoxShape.circle),
          ).icon(shape: BoxShape.rectangle),
          child: const Icon(Icons.settings),
        ),
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    TextButton.icon(
      onPressed: () {},
      child: const Icon(Icons.settings),
    ),
    TonalButton.icon(
      onPressed: () {},
      shape: BoxShape.rectangle,
      child: const Icon(Icons.settings),
    ),
    ElevatedButton.icon(
      onPressed: () {},
      child: const Icon(Icons.settings),
    ),
    FilledButton.icon(
      onPressed: () {},
      pressedStyle: ButtonStyle(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Icon(Icons.settings),
    ),
    Button(
      onPressed: () {},
      style: const DrivenButtonStyle.outlined(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        hoveredStyle: ButtonStyle(shape: BoxShape.circle),
      ).icon(shape: BoxShape.rectangle),
      child: const Icon(Icons.settings),
    ),
  ],
)''';
