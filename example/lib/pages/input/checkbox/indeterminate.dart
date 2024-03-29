import 'package:flutter/material.dart' hide Checkbox;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/input.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class CheckboxIndeterminateUsage extends StatefulWidget {
  const CheckboxIndeterminateUsage({Key? key}) : super(key: key);

  @override
  State<CheckboxIndeterminateUsage> createState() =>
      _CheckboxIndeterminateUsageState();
}

class _CheckboxIndeterminateUsageState
    extends State<CheckboxIndeterminateUsage> {
  List<String> choices = ['Android', 'IOS', 'Windows', 'Web'];
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
                (i) => CheckboxTile(
                  selected: group.has(choices[i]),
                  onChanged: group.select(choices[i]),
                  buttonStyle: const DrivenButtonStyle.outlined(
                    foregroundSpacing: 10,
                  ),
                  child: Text(choices[i]),
                ),
              )..add(CheckboxTile(
                  selected: group.isChecked,
                  indeterminate: group.isIndeterminate,
                  onChanged: group.selectAll(),
                  buttonStyle: const DrivenButtonStyle.filled(
                    foregroundSpacing: 10,
                  ),
                  checkboxStyle: DrivenCheckboxStyle(
                    shape: BoxShape.circle,
                    backgroundColor: Colors.white,
                    borderStyle: BorderStyle.none,
                    selectedStyle: CheckboxStyle(
                      backgroundColor: Colors.white,
                      checkmarkColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  controlAffinity: ControlAffinity.trailing,
                  child: const Text('Select All'),
                )),
            );
          },
        ),
      ],
    );
  }
}

const script = '''List<String> choices = ['Android', 'IOS', 'Windows', 'Web'];
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
        (i) => CheckboxTile(
          selected: group.has(choices[i]),
          onChanged: group.select(choices[i]),
          buttonStyle: const DrivenButtonStyle.outlined(
            foregroundSpacing: 10,
          ),
          child: Text(choices[i]),
        ),
      )..add(CheckboxTile(
          selected: group.isChecked,
          indeterminate: group.isIndeterminate,
          onChanged: group.selectAll(),
          buttonStyle: const DrivenButtonStyle.filled(
            foregroundSpacing: 10,
          ),
          checkboxStyle: DrivenCheckboxStyle(
            shape: BoxShape.circle,
            backgroundColor: Colors.white,
            borderStyle: BorderStyle.none,
            selectedStyle: CheckboxStyle(
              backgroundColor: Colors.white,
              checkmarkColor: Theme.of(context).primaryColor,
            ),
          ),
          controlAffinity: ControlAffinity.trailing,
          child: const Text('Select All'),
        )),
    );
  },
)''';
