import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/typography.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/button.dart';

import '../sample.dart';

class ButtonBlockUsage extends StatelessWidget {
  const ButtonBlockUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineText.large('Block Button'),
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
                        width: double.infinity,
                      ),
                      leading: const Icon(Icons.calendar_month),
                      child: const Text('Flat Button'),
                    ),
                    Button(
                      onPressed: () => {},
                      style: ButtonStyle.toned(
                        width: double.infinity,
                      ),
                      trailing: const Icon(Icons.close),
                      child: const Text('Toned Button'),
                    ),
                    Button(
                      onPressed: () => {},
                      style: ButtonStyle.outlined(
                        width: double.infinity,
                      ),
                      leading: const Icon(Icons.calendar_month),
                      trailing: const Icon(Icons.close),
                      child: const Text('Outlined Button'),
                    ),
                    Button(
                      onPressed: () => {},
                      style: ButtonStyle.filled(
                        width: double.infinity,
                      ),
                      leading: const SizedBox.square(
                        dimension: 18,
                        child: CircularProgressIndicator(),
                      ),
                      child: const Text('Filled Button'),
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