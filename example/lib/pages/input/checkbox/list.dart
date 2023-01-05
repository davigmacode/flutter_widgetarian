import 'package:flutter/material.dart' hide Checkbox, ButtonStyle;
import 'package:widgetarian/input.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class CheckboxListUsage extends StatefulWidget {
  const CheckboxListUsage({Key? key}) : super(key: key);

  @override
  State<CheckboxListUsage> createState() => _CheckboxListUsageState();
}

class _CheckboxListUsageState extends State<CheckboxListUsage> {
  List<String> choices = ['Flutter', 'React', 'Ionic'];
  List<String> selected = [];

  void setSelected(List<String> value) {
    setState(() => selected = value);
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'List Usage',
      script: script,
      children: [
        Choice<String>(
          mandatory: true,
          value: selected,
          onChanged: setSelected,
          builder: (context, group, _) {
            return SizedBox(
              width: 200,
              child: ListView(
                shrinkWrap: true,
                children: List<Widget>.generate(
                  choices.length,
                  (i) => CheckboxTile.list(
                    spacing: 15,
                    selected: group.has(choices[i]),
                    onChanged: group.select(choices[i]),
                    child: Text(choices[i]),
                  ),
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
    return SizedBox(
      width: 200,
      child: ListView(
        shrinkWrap: true,
        children: List<Widget>.generate(
          choices.length,
          (i) => CheckboxTile.list(
            spacing: 15,
            selected: group.has(choices[i]),
            onChanged: group.select(choices[i]),
            child: Text(choices[i]),
          ),
        ),
      ),
    );
  },
)''';
