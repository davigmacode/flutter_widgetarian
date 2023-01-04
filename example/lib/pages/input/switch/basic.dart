import 'package:flutter/material.dart' hide Switch;
import 'package:widgetarian/input.dart';

import '../../sample.dart';

class SwitchBasicUsage extends StatefulWidget {
  const SwitchBasicUsage({Key? key}) : super(key: key);

  @override
  State<SwitchBasicUsage> createState() => _SwitchBasicUsageState();
}

class _SwitchBasicUsageState extends State<SwitchBasicUsage> {
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
        Switch(
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

Switch(
  selected: _checked,
  onChanged: _setChecked,
)''';
