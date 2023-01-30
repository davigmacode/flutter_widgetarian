import 'package:flutter/material.dart'
    hide ButtonStyle, TextButton, OutlinedButton;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ToggleButtonBlockUsage extends StatelessWidget {
  const ToggleButtonBlockUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Block Button',
      script: script,
      wrapped: false,
      children: [
        Choice<String>(
          multiple: true,
          builder: (context, group, _) {
            return ListView(
              shrinkWrap: true,
              children: [
                TextToggleButton.block(
                  selected: group.has('text'),
                  onSelected: group.select('text'),
                  child: const Text('Text Button'),
                ),
                const Gap(15),
                TonalToggleButton.block(
                  selected: group.has('tonal'),
                  onSelected: group.select('tonal'),
                  trailing: const Icon(Icons.close),
                  child: const Text('Tonal Button'),
                ),
                const Gap(15),
                OutlinedToggleButton.block(
                  expanded: false,
                  justifyChildren: MainAxisAlignment.spaceBetween,
                  selected: group.has('outlined'),
                  onSelected: group.select('outlined'),
                  leading: const Icon(Icons.calendar_month),
                  trailing: const Icon(Icons.close),
                  child: const Text('Outlined Button'),
                ),
                const Gap(15),
                FilledToggleButton.block(
                  selected: group.has('filled'),
                  onSelected: group.select('filled'),
                  expanded: false,
                  child: const Text('Filled Button'),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

const script = '''Column(
  children: [
    TextButton.block(
      onPressed: () {},
      child: const Text('Text Button'),
    ),
    TonalButton.block(
      onPressed: () {},
      trailing: const Icon(Icons.close),
      child: const Text('Tonal Button'),
    ),
    OutlinedButton.block(
      expanded: false,
      justifyChildren: MainAxisAlignment.spaceBetween,
      onPressed: () {},
      leading: const Icon(Icons.calendar_month),
      trailing: const Icon(Icons.close),
      child: const Text('Outlined Button'),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.filled().block(expanded: false),
      leading: const SizedBox.square(
        dimension: 18,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
      child: const Text('Filled Button'),
    ),
  ],
)''';
