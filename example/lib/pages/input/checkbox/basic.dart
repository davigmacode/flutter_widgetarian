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

Checkbox(
  selected: _checked,
  onChanged: _setChecked,
),''';
