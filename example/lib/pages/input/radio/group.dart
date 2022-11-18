import 'package:flutter/material.dart' hide Radio;
import 'package:widgetarian/typography.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/input.dart';
import 'package:widgetarian/group.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineText.large('Grouped Usage'),
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
                      mandatory: true,
                      value: selected,
                      onChanged: setSelected,
                      builder: (context, group, _) {
                        return Wrap(
                          children: List<Widget>.generate(
                            choices.length,
                            (i) => Radio(
                              label: Text(choices[i]),
                              checked: group.has(choices[i]),
                              onChanged: group.select(choices[i]),
                            ),
                          ),
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
