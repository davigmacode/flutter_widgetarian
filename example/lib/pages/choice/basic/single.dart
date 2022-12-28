import 'package:flutter/material.dart'
    hide Checkbox, Radio, Switch, Chip, ButtonStyle;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/input.dart';
import 'package:widgetarian/display.dart';
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ChoiceBasicSingleUsage extends StatefulWidget {
  const ChoiceBasicSingleUsage({Key? key}) : super(key: key);

  @override
  State<ChoiceBasicSingleUsage> createState() => _ChoiceBasicSingleUsageState();
}

class _ChoiceBasicSingleUsageState extends State<ChoiceBasicSingleUsage> {
  List<String> strChoices = ['Flutter', 'React', 'Ionic'];
  List<String> strSelected = [];

  void setStrSelected(List<String> value) {
    setState(() => strSelected = value);
  }

  List<IconData> iconChoices = [
    Icons.format_align_left,
    Icons.format_align_center,
    Icons.format_align_right,
    Icons.format_align_justify,
  ];
  List<IconData> iconSelected = [];

  void setIconSelected(List<IconData> value) {
    setState(() => iconSelected = value);
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Single Choice',
      script: script,
      wrapped: false,
      children: [
        Choice<String>(
          mandatory: true,
          value: strSelected,
          onChanged: setStrSelected,
          builder: (context, group, _) {
            return Wrap(
              children: List<Widget>.generate(
                strChoices.length,
                (i) => CheckboxTile(
                  selected: group.has(strChoices[i]),
                  onChanged: group.select(strChoices[i]),
                  child: Text(strChoices[i]),
                ),
              ),
            );
          },
        ),
        const Gap(20),
        Choice<String>(
          mandatory: true,
          value: strSelected,
          onChanged: setStrSelected,
          builder: (context, group, _) {
            return Wrap(
              children: List<Widget>.generate(
                strChoices.length,
                (i) => RadioTile(
                  selected: group.has(strChoices[i]),
                  onChanged: group.select(strChoices[i]),
                  child: Text(strChoices[i]),
                ),
              ),
            );
          },
        ),
        const Gap(20),
        Choice<String>(
          mandatory: true,
          value: strSelected,
          onChanged: setStrSelected,
          builder: (context, group, _) {
            return Wrap(
              children: List<Widget>.generate(
                strChoices.length,
                (i) => SwitchTile(
                  selected: group.has(strChoices[i]),
                  onChanged: group.select(strChoices[i]),
                  child: Text(strChoices[i]),
                ),
              ),
            );
          },
        ),
        const Gap(20),
        Choice<String>(
          mandatory: true,
          value: strSelected,
          onChanged: setStrSelected,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: List<Widget>.generate(
                strChoices.length,
                (i) => Chip(
                  label: Text(strChoices[i]),
                  selected: group.has(strChoices[i]),
                  onSelected: group.select(strChoices[i]),
                ),
              ),
            );
          },
        ),
        const Gap(20),
        Choice<IconData>(
          mandatory: true,
          value: iconSelected,
          onChanged: setIconSelected,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: List<Widget>.generate(
                iconChoices.length,
                (i) => ToggleButton.icon(
                  selected: group.has(iconChoices[i]),
                  onSelected: group.select(iconChoices[i]),
                  style: DrivenButtonStyle.text(
                    hoveredStyle: ButtonStyle(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    selectedStyle: DrivenButtonStyle.filled(
                      color: Theme.of(context).colorScheme.primary,
                      hoveredStyle: const ButtonStyle(backgroundOpacity: .3),
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
