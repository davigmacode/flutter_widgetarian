import 'package:flutter/material.dart' hide ButtonStyle;
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
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.text().icon(),
          child: const Icon(Icons.settings),
        ),
        Button.icon(
          onPressed: () {},
          shape: BoxShape.rectangle,
          style: DrivenButtonStyle.tonal(),
          child: const Icon(Icons.settings),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.outlined(
            hoveredStyle: ButtonStyle(
              borderRadius: BorderRadius.circular(25),
            ),
          ).icon(shape: BoxShape.rectangle),
          child: const Icon(Icons.settings),
        ),
        Button.icon(
          onPressed: () {},
          style: DrivenButtonStyle.filled(
            pressedStyle: const ButtonStyle(
              shape: BoxShape.rectangle,
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
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.text().icon(),
      child: const Icon(Icons.settings),
    ),
    Button.icon(
      onPressed: () {},
      shape: BoxShape.rectangle,
      style: DrivenButtonStyle.tonal(),
      child: const Icon(Icons.settings),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.outlined(
        hoveredStyle: ButtonStyle(
          borderRadius: BorderRadius.circular(25),
        ),
      ).icon(shape: BoxShape.rectangle),
      child: const Icon(Icons.settings),
    ),
    Button.icon(
      onPressed: () {},
      style: DrivenButtonStyle.filled(
        pressedStyle: const ButtonStyle(
          shape: BoxShape.rectangle,
        ),
      ),
      child: const Icon(Icons.settings),
    ),
  ],
)''';
