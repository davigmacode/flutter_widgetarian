import 'package:flutter/material.dart'
    hide Checkbox, Radio, Switch, Chip, ButtonStyle;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/input.dart';
import 'package:widgetarian/display.dart';
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ChoiceBasicMultipleUsage extends StatefulWidget {
  const ChoiceBasicMultipleUsage({Key? key}) : super(key: key);

  @override
  State<ChoiceBasicMultipleUsage> createState() =>
      _ChoiceBasicMultipleUsageState();
}

class _ChoiceBasicMultipleUsageState extends State<ChoiceBasicMultipleUsage> {
  List<String> strChoices = ['Flutter', 'React', 'Ionic'];
  List<String> strSelected = [];

  void setStrSelected(List<String> value) {
    setState(() => strSelected = value);
  }

  List<IconData> iconChoices = [
    Icons.format_bold,
    Icons.format_underline,
    Icons.format_italic,
  ];
  List<IconData> iconSelected = [];

  void setIconSelected(List<IconData> value) {
    setState(() => iconSelected = value);
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Multiple Choice',
      script: script,
      wrapped: false,
      children: [
        Choice<String>(
          multiple: true,
          items: strChoices,
          value: strSelected,
          onChanged: setStrSelected,
          builder: (context, group, _) {
            return Wrap(
              children: List<Widget>.generate(
                strChoices.length,
                (i) => Checkbox(
                  label: Text(strChoices[i]),
                  checked: group.has(strChoices[i]),
                  onChanged: group.select(strChoices[i]),
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
        const Gap(20),
        Choice<String>(
          multiple: true,
          items: strChoices,
          value: strSelected,
          onChanged: setStrSelected,
          builder: (context, group, _) {
            return Wrap(
              children: List<Widget>.generate(
                strChoices.length,
                (i) => Switch(
                  label: Text(strChoices[i]),
                  checked: group.has(strChoices[i]),
                  onChanged: group.select(strChoices[i]),
                ),
              )..add(Switch(
                  label: const Text('Select All'),
                  checked: group.isChecked,
                  indeterminate: group.isIndeterminate,
                  onChanged: group.selectAll(),
                )),
            );
          },
        ),
        const Gap(20),
        Choice<String>(
          multiple: true,
          items: strChoices,
          value: strSelected,
          onChanged: setStrSelected,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: List<Widget>.generate(
                strChoices.length,
                (i) => Chip(
                  checkmark: true,
                  label: Text(strChoices[i]),
                  selected: group.has(strChoices[i]),
                  onSelected: group.select(strChoices[i]),
                ),
              )..add(Chip(
                  checkmark: true,
                  label: const Text('Select All'),
                  selected: group.isChecked,
                  onSelected: group.selectAll(),
                )),
            );
          },
        ),
        const Gap(20),
        Choice<IconData>(
          multiple: true,
          items: iconChoices,
          value: iconSelected,
          onChanged: setIconSelected,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: List<Widget>.generate(
                iconChoices.length,
                (i) => Button(
                  selected: group.has(iconChoices[i]),
                  onSelected: group.select(iconChoices[i]),
                  style: ButtonStyle.flat(
                    shape: BoxShape.circle,
                    hoveredStyle: ButtonStyle(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    selectedStyle: ButtonStyle(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Icon(iconChoices[i]),
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

ChoiceGroup<String>(
  exclusive: true,
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
      ),
    );
  },
)''';
