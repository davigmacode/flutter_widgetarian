import 'package:flutter/material.dart' hide Radio;
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
    return Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        Radio(
          selected: _checked,
          onChanged: _setChecked,
        ),
      ],
    );
  }
}

const script = '''bool _checked = false;

void _setChecked(bool value) {
  setState(() => _checked = value);
}

Radio(
  selected: _checked,
  onChanged: _setChecked,
)''';
