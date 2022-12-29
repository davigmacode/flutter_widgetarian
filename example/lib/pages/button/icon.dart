import 'package:flutter/material.dart'
    hide ButtonStyle, TextButton, OutlinedButton;
import 'package:widgetarian/button.dart';

import '../sample.dart';

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
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.outlined(
            hoveredStyle: ButtonStyle(
              borderRadius: BorderRadius.circular(5),
            ),
          ).icon(shape: BoxShape.rectangle),
          child: const Icon(Icons.settings),
        ),
        Button.icon(
          onPressed: () {},
          style: DrivenButtonStyle.filled(
            pressedStyle: ButtonStyle(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
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
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.outlined(
        hoveredStyle: ButtonStyle(
          borderRadius: BorderRadius.circular(5),
        ),
      ).icon(shape: BoxShape.rectangle),
      child: const Icon(Icons.settings),
    ),
    Button.icon(
      onPressed: () {},
      style: DrivenButtonStyle.filled(
        pressedStyle: ButtonStyle(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: const Icon(Icons.settings),
    ),
  ],
)''';
