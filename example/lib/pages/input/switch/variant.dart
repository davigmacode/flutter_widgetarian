import 'package:flutter/material.dart' hide Switch;
import 'package:widgetarian/input.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class SwitchVariantUsage extends StatefulWidget {
  const SwitchVariantUsage({Key? key}) : super(key: key);

  @override
  State<SwitchVariantUsage> createState() => _SwitchVariantUsageState();
}

class _SwitchVariantUsageState extends State<SwitchVariantUsage> {
  List<String> selected = [];

  void setSelected(List<String> value) {
    setState(() => selected = value);
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Variant Usage',
      script: script,
      children: [
        Choice<String>(
          mandatory: true,
          value: selected,
          onChanged: setSelected,
          builder: (context, group, _) {
            return Wrap(
              spacing: 15,
              children: [
                SwitchTile(
                  spacing: 12,
                  selected: group.has('m2'),
                  onChanged: group.select('m2'),
                  child: const Text('M2'),
                ),
                SwitchTile(
                  overlayDisabled: true,
                  spacing: 12,
                  switchStyle: DrivenSwitchStyle.m3(),
                  selected: group.has('m3'),
                  onChanged: group.select('m3'),
                  child: const Text('M3'),
                ),
                SwitchTile(
                  overlayDisabled: true,
                  spacing: 12,
                  switchStyle: DrivenSwitchStyle.ios(),
                  selected: group.has('ios'),
                  onChanged: group.select('ios'),
                  child: const Text('IOS'),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

const script = '''List<String> selected = [];

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
      children: [
        SwitchTile(
          spacing: 12,
          selected: group.has('m2'),
          onChanged: group.select('m2'),
          child: const Text('M2'),
        ),
        SwitchTile(
          overlayDisabled: true,
          spacing: 12,
          switchStyle: DrivenSwitchStyle.m3(),
          selected: group.has('m3'),
          onChanged: group.select('m3'),
          child: const Text('M3'),
        ),
        SwitchTile(
          overlayDisabled: true,
          spacing: 12,
          switchStyle: DrivenSwitchStyle.ios(),
          selected: group.has('ios'),
          onChanged: group.select('ios'),
          child: const Text('IOS'),
        ),
      ],
    );
  },
)''';
