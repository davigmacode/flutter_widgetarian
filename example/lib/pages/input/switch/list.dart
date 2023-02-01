import 'package:flutter/material.dart' hide Switch, ButtonStyle;
import 'package:widgetarian/input.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class SwitchListUsage extends StatefulWidget {
  const SwitchListUsage({Key? key}) : super(key: key);

  @override
  State<SwitchListUsage> createState() => _SwitchListUsageState();
}

class _SwitchListUsageState extends State<SwitchListUsage> {
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
                  (i) => SwitchTile.list(
                    controlAffinity: ControlAffinity.trailing,
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
          (i) => SwitchTile.list(
            controlAffinity: ControlAffinity.trailing,
            selected: group.has(choices[i]),
            onChanged: group.select(choices[i]),
            child: Text(choices[i]),
          ),
        ),
      ),
    );
  },
)''';
