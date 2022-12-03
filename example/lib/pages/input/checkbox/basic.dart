import 'package:flutter/material.dart' hide Checkbox;
import 'package:widgetarian/input.dart';

import '../../sample.dart';

class CheckboxBasicUsage extends StatefulWidget {
  const CheckboxBasicUsage({Key? key}) : super(key: key);

  @override
  State<CheckboxBasicUsage> createState() => _CheckboxBasicUsageState();
}

class _CheckboxBasicUsageState extends State<CheckboxBasicUsage> {
  bool _checked = false;

  void _setChecked(bool value) {
    setState(() => _checked = value);
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        Checkbox(
          checked: _checked,
          onChanged: _setChecked,
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
