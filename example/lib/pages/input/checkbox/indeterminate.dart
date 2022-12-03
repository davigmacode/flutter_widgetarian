import 'package:flutter/material.dart' hide Checkbox;
import 'package:widgetarian/typography.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/input.dart';
import 'package:widgetarian/group.dart';

import '../../sample.dart';

class CheckboxIndeterminateUsage extends StatefulWidget {
  const CheckboxIndeterminateUsage({Key? key}) : super(key: key);

  @override
  State<CheckboxIndeterminateUsage> createState() =>
      _CheckboxIndeterminateUsageState();
}

class _CheckboxIndeterminateUsageState
    extends State<CheckboxIndeterminateUsage> {
  List<String> choices = ['Android', 'IOS', 'Windows'];
  List<String> selected = [];

  void setSelected(List<String> value) {
    setState(() => selected = value);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineText.large('Indeterminate Usage'),
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
                    ChoiceGroup<String>(
                      multiple: true,
                      items: choices,
                      value: selected,
                      onChanged: setSelected,
                      builder: (context, group, _) {
                        return Wrap(
                          children: List<Widget>.generate(
                            choices.length,
                            (i) => Checkbox(
                              label: Text(choices[i]),
                              checked: group.has(choices[i]),
                              onChanged: group.select(choices[i]),
                            ),
                          )..add(Checkbox(
                              label: const Text('Select All'),
                              checked: group.isChecked,
                              indeterminate: group.isIndeterminate,
                              onChanged: group.selectAll(),
                            )),
                        );
                      },
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