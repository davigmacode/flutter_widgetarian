import 'package:flutter/material.dart' hide Switch;
import 'package:widgetarian/input.dart';
import 'package:widgetarian/button.dart';
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
              children: List<Widget>.generate(
                choices.length,
                (i) => SwitchTile(
                  selected: group.has(choices[i]),
                  onChanged: group.select(choices[i]),
                  buttonStyle: DrivenButtonStyle.outlined(
                    foregroundSpacing: 12,
                  ),
                  child: Text(choices[i]),
                ),
              )..add(SwitchTile(
                  selected: group.isChecked,
                  indeterminate: group.isIndeterminate,
                  onChanged: group.selectAll(),
                  buttonStyle: DrivenButtonStyle.tonal(
                    foregroundSpacing: 12,
                  ),
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

ChoiceGroup<String>(
  items: choices,
  value: selected,
  onChanged: setSelected,
  builder: (context, group, _) {
    return Wrap(
      children: List<Widget>.generate(
        choices.length,
        (i) => Checkbox<String>(
          label: Text(choices[i]),
          checked: group.has(choices[i]),
          onChanged: group.select(choices[i]),
        ),
      )..add(Checkbox<String>(
          label: const Text('Select All'),
          checked: group.isChecked,
          indeterminate: group.isIndeterminate,
          onChanged: group.selectAll(),
        )),
    );
  },
)''';
