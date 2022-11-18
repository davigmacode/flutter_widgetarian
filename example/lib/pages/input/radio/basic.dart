import 'package:flutter/material.dart' hide Radio;
import 'package:widgetarian/typography.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/input.dart';

import '../../sample.dart';

class RadioBasicUsage extends StatefulWidget {
  const RadioBasicUsage({Key? key}) : super(key: key);

  @override
  State<RadioBasicUsage> createState() => _RadioBasicUsageState();
}

class _RadioBasicUsageState extends State<RadioBasicUsage> {
  bool _checked = false;

  void _setChecked(bool value) {
    setState(() => _checked = value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineText.large('Basic Usage'),
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
                    Radio(
                      checked: _checked,
                      onChanged: _setChecked,
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
