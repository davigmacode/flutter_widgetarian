import 'package:flutter/material.dart' hide Switch;
import 'package:widgetarian/input.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class SwitchIndeterminateUsage extends StatefulWidget {
  const SwitchIndeterminateUsage({Key? key}) : super(key: key);

  @override
  State<SwitchIndeterminateUsage> createState() =>
      _SwitchIndeterminateUsageState();
}

class _SwitchIndeterminateUsageState extends State<SwitchIndeterminateUsage> {
  List<String> choices = ['Android', 'IOS', 'Windows'];
  List<String> selected = [];

  void setSelected(List<String> value) {
    setState(() => selected = value);
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Indeterminate Usage',
      script: script,
      children: [
        Choice<String>(
          multiple: true,
          items: choices,
          value: selected,
          onChanged: setSelected,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              runSpacing: 15,
              children: List<Widget>.generate(
                choices.length,
                (i) => SwitchTile(
                  selected: group.has(choices[i]),
                  onChanged: group.select(choices[i]),
                  spacing: 12,
                  child: Text(choices[i]),
                ),
              )..add(SwitchTile(
                  selected: group.isChecked,
                  indeterminate: group.isIndeterminate,
                  onChanged: group.selectAll(),
                  spacing: 12,
                  child: const Text('Select All'),
                )),
            );
          },
        ),
      ],
    );
  }
}

const script = '''List<String> choices = ['Android', 'IOS', 'Windows'];
List<String> selected = [];

void setSelected(List<String> value) {
  setState(() => selected = value);
}

Choice<String>(
  multiple: true,
  items: choices,
  value: selected,
  onChanged: setSelected,
  builder: (context, group, _) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: List<Widget>.generate(
        choices.length,
        (i) => SwitchTile(
          selected: group.has(choices[i]),
          onChanged: group.select(choices[i]),
          spacing: 12,
          child: Text(choices[i]),
        ),
      )..add(SwitchTile(
          selected: group.isChecked,
          indeterminate: group.isIndeterminate,
          onChanged: group.selectAll(),
          spacing: 12,
          child: const Text('Select All'),
        )),
    );
  },
)''';
