import 'package:flutter/material.dart' hide Checkbox;
import 'package:widgetarian/input.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class CheckboxGroupUsage extends StatefulWidget {
  const CheckboxGroupUsage({Key? key}) : super(key: key);

  @override
  State<CheckboxGroupUsage> createState() => _CheckboxGroupUsageState();
}

class _CheckboxGroupUsageState extends State<CheckboxGroupUsage> {
  List<String> choices = ['Flutter', 'React', 'Ionic'];
  List<String> selected = [];

  void setSelected(List<String> value) {
    setState(() => selected = value);
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Grouped Usage',
      script: script,
      children: [
        Choice<String>(
          mandatory: true,
          value: selected,
          onChanged: setSelected,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: List<Widget>.generate(
                choices.length,
                (i) => CheckboxTile(
                  selected: group.has(choices[i]),
                  onChanged: group.select(choices[i]),
                  child: Text(choices[i]),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

const script = '''List<String> choices = ['Flutter', 'React', 'Ionic'];
List<String> selected = [];

void setSelected(List<String> value) {
  setState(() => selected = value);
}

Choice<String>(
  mandatory: true,
  value: selected,
  onChanged: setSelected,
  builder: (context, group, _) {
    return Wrap(
      spacing: 15,
      children: List<Widget>.generate(
        choices.length,
        (i) => CheckboxTile(
          selected: group.has(choices[i]),
          onChanged: group.select(choices[i]),
          child: Text(choices[i]),
        ),
      ),
    );
  },
)''';
