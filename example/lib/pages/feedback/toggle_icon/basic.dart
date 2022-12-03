import 'package:flutter/material.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/choice.dart';

import '../../sample.dart';

class ToggleIconBasicUsage extends StatefulWidget {
  const ToggleIconBasicUsage({Key? key}) : super(key: key);

  @override
  State<ToggleIconBasicUsage> createState() => _ToggleIconBasicUsageState();
}

class _ToggleIconBasicUsageState extends State<ToggleIconBasicUsage> {
  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        Choice(
          multiple: true,
          // mandatory: true,
          builder: (context, state, child) {
            return Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                ToggleIcon(
                  selected: state.has('bookmark'),
                  onSelected: state.select('bookmark'),
                  style: ToggleIconStyle.when(
                    enabled: const ToggleIconStyle(
                      size: 30,
                      outerOpacity: 1,
                      innerOpacity: 0,
                      overlayRadius: 0,
                    ),
                    selected: ToggleIconStyle(
                      outerColor: Theme.of(context).colorScheme.primary,
                      innerColor: Theme.of(context).colorScheme.primary,
                      innerOpacity: 1,
                    ),
                    hovered: const ToggleIconStyle(overlayRadius: 20),
                    pressed: const ToggleIconStyle(overlayRadius: 0),
                  ),
                  outerIcon: Icons.bookmark_border,
                  innerIcon: Icons.bookmark,
                ),
                ToggleIcon(
                  selected: state.has('favorite'),
                  onSelected: state.select('favorite'),
                  style: ToggleIconStyle.when(
                    enabled: const ToggleIconStyle(
                      size: 30,
                      outerOpacity: 1,
                      innerOpacity: 0,
                      innerScale: 0,
                      overlayRadius: 0,
                    ),
                    selected: ToggleIconStyle(
                      outerColor: Theme.of(context).colorScheme.primary,
                      innerColor: Theme.of(context).colorScheme.primary,
                      innerOpacity: 1,
                      innerScale: 1,
                    ),
                    hovered: const ToggleIconStyle(overlayRadius: 20),
                    pressed: const ToggleIconStyle(overlayRadius: 0),
                  ),
                  outerIcon: Icons.favorite_border,
                  innerIcon: Icons.favorite,
                ),
                ToggleIcon(
                  selected: state.has('star'),
                  onSelected: state.select('star'),
                  style: ToggleIconStyle.when(
                    enabled: const ToggleIconStyle(
                      size: 30,
                      outerOpacity: 1,
                      innerOpacity: 0,
                      innerScale: 3,
                      overlayRadius: 0,
                    ),
                    selected: ToggleIconStyle(
                      outerColor: Theme.of(context).colorScheme.primary,
                      innerColor: Theme.of(context).colorScheme.primary,
                      innerOpacity: 1,
                      innerScale: 1,
                    ),
                    hovered: const ToggleIconStyle(overlayRadius: 20),
                    pressed: const ToggleIconStyle(overlayRadius: 0),
                  ),
                  outerIcon: Icons.star_border,
                  innerIcon: Icons.star,
                ),
                ToggleIcon(
                  selected: state.has('tree'),
                  onSelected: state.select('tree'),
                  style: ToggleIconStyle.when(
                    enabled: const ToggleIconStyle(
                      size: 30,
                      outerOpacity: 1,
                      innerOpacity: 0,
                      overlayRadius: 0,
                    ),
                    selected: ToggleIconStyle(
                      outerColor: Theme.of(context).colorScheme.primary,
                      innerColor: Theme.of(context).colorScheme.primary,
                      innerOpacity: 1,
                    ),
                    hovered: const ToggleIconStyle(overlayRadius: 20),
                    pressed: const ToggleIconStyle(overlayRadius: 0),
                  ),
                  outerIcon: Icons.account_tree_outlined,
                  innerIcon: Icons.account_tree,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    Button(
      onPressed: () => {},
      style: ButtonStyle.flat(),
      child: const Text('Flat Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.toned(),
      child: const Text('Toned Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.outlined(),
      child: const Text('Outlined Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.filled(),
      child: const Text('Filled Button'),
    ),
  ],
)''';
