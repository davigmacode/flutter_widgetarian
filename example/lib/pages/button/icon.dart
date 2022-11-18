import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/typography.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/button.dart';

import '../sample.dart';

class ButtonIconUsage extends StatelessWidget {
  const ButtonIconUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineText.large('Icon Button'),
          const Gap.size(15),
          Sample(
            script: script,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: [
                    Button(
                      onPressed: () => {},
                      style: ButtonStyle.flat(
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.settings),
                    ),
                    Button(
                      onPressed: () => {},
                      style: ButtonStyle.toned(
                        padding: EdgeInsets.zero,
                        width: ButtonStyle.defaultHeight,
                      ),
                      child: const Icon(Icons.settings),
                    ),
                    Button(
                      onPressed: () => {},
                      style: ButtonStyle.outlined(
                        padding: EdgeInsets.zero,
                        width: ButtonStyle.defaultHeight,
                        hoveredStyle: ButtonStyle(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Icon(Icons.settings),
                    ),
                    Button(
                      onPressed: () => {},
                      style: ButtonStyle.filled(
                        shape: BoxShape.circle,
                        pressedStyle: const ButtonStyle(
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      child: const Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    Button(
      onPressed: () => {},
      style: ButtonStyle.flat(
        shape: BoxShape.circle,
      ),
      child: const Icon(Icons.settings),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.toned(
        padding: EdgeInsets.zero,
        width: ButtonStyle.defaultHeight,
      ),
      child: const Icon(Icons.settings),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.outlined(
        padding: EdgeInsets.zero,
        width: ButtonStyle.defaultHeight,
        hoveredStyle: ButtonStyle(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      child: const Icon(Icons.settings),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.filled(
        shape: BoxShape.circle,
        pressedStyle: const ButtonStyle(
          shape: BoxShape.rectangle,
        ),
      ),
      child: const Icon(Icons.settings),
    ),
  ],
)''';
