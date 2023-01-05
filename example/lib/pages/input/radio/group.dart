import 'package:flutter/material.dart' hide Radio;
import 'package:widgetarian/input.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class RadioGroupUsage extends StatefulWidget {
  const RadioGroupUsage({Key? key}) : super(key: key);

  @override
  State<RadioGroupUsage> createState() => _RadioGroupUsageState();
}

class _RadioGroupUsageState extends State<RadioGroupUsage> {
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
              runSpacing: 15,
              children: List<Widget>.generate(
                choices.length,
                (i) => RadioTile(
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
      runSpacing: 15,
      children: List<Widget>.generate(
        choices.length,
        (i) => RadioTile(
          selected: group.has(choices[i]),
          onChanged: group.select(choices[i]),
          child: Text(choices[i]),
        ),
      ),
    );
  },
)''';
