import 'package:flutter/material.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/navigation.dart';

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
          builder: (context, choice, child) {
            return Wrap(
              spacing: 15,
              runSpacing: 15,
              children: [
                Anchor(
                  onTap: () => choice.toggle('bookmark'),
                  style: const DrivenAnchorStyle.circle(
                    radius: 0,
                    hoveredStyle: AnchorStyle(radius: 20),
                    pressedStyle: AnchorStyle(radius: 0),
                  ),
                  child: ToggleIcon(
                    Icons.bookmark,
                    backIcon: Icons.bookmark_border,
                    selected: choice.has('bookmark'),
                    style: DrivenToggleIconStyle.fade(size: 30),
                  ),
                ),
                Anchor(
                  onTap: () => choice.toggle('favorite'),
                  style: const DrivenAnchorStyle.circle(
                    radius: 0,
                    hoveredStyle: AnchorStyle(radius: 20),
                    pressedStyle: AnchorStyle(radius: 0),
                  ),
                  child: ToggleIcon(
                    Icons.favorite,
                    backIcon: Icons.favorite_border,
                    selected: choice.has('favorite'),
                    style: DrivenToggleIconStyle.scaleUp(size: 30),
                  ),
                ),
                Anchor(
                  onTap: () => choice.toggle('star'),
                  style: const DrivenAnchorStyle.circle(
                    radius: 0,
                    hoveredStyle: AnchorStyle(radius: 20),
                    pressedStyle: AnchorStyle(radius: 0),
                  ),
                  child: ToggleIcon(
                    Icons.star,
                    selected: choice.has('star'),
                    style: DrivenToggleIconStyle.scaleDown(size: 30),
                  ),
                ),
                Anchor(
                  onTap: () => choice.toggle('tree'),
                  style: const DrivenAnchorStyle.circle(
                    radius: 0,
                    hoveredStyle: AnchorStyle(radius: 20),
                    pressedStyle: AnchorStyle(radius: 0),
                  ),
                  child: ToggleIcon(
                    Icons.account_tree,
                    backIcon: Icons.account_tree_outlined,
                    selected: choice.has('tree'),
                    style: const DrivenToggleIconStyle(
                      size: 30,
                      opacity: 0,
                      color: Colors.orange,
                      selectedStyle: ToggleIconStyle(opacity: 1),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

const script = '''Choice(
  multiple: true,
  builder: (context, choice, child) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: [
        Anchor(
          onTap: () => choice.toggle('bookmark'),
          style: const DrivenAnchorStyle.circle(
            radius: 0,
            hoveredStyle: AnchorStyle(radius: 20),
            pressedStyle: AnchorStyle(radius: 0),
          ),
          child: ToggleIcon(
            selected: choice.has('bookmark'),
            style: DrivenToggleIconStyle.fade(size: 30),
            outerIcon: Icons.bookmark_border,
            innerIcon: Icons.bookmark,
          ),
        ),
        Anchor(
          onTap: () => choice.toggle('favorite'),
          style: const DrivenAnchorStyle.circle(
            radius: 0,
            hoveredStyle: AnchorStyle(radius: 20),
            pressedStyle: AnchorStyle(radius: 0),
          ),
          child: ToggleIcon(
            selected: choice.has('favorite'),
            style: DrivenToggleIconStyle.scaleUp(size: 30),
            outerIcon: Icons.favorite_border,
            innerIcon: Icons.favorite,
          ),
        ),
        Anchor(
          onTap: () => choice.toggle('star'),
          style: const DrivenAnchorStyle.circle(
            radius: 0,
            hoveredStyle: AnchorStyle(radius: 20),
            pressedStyle: AnchorStyle(radius: 0),
          ),
          child: ToggleIcon(
            selected: choice.has('star'),
            style: DrivenToggleIconStyle.scaleDown(size: 30),
            outerIcon: Icons.star,
            innerIcon: Icons.star,
          ),
        ),
        Anchor(
          onTap: () => choice.toggle('tree'),
          style: const DrivenAnchorStyle.circle(
            radius: 0,
            hoveredStyle: AnchorStyle(radius: 20),
            pressedStyle: AnchorStyle(radius: 0),
          ),
          child: ToggleIcon(
            selected: choice.has('tree'),
            style: DrivenToggleIconStyle(
              size: 30,
              outerColor: Theme.of(context).iconTheme.color,
              outerOpacity: 1,
              innerOpacity: 0,
              selectedStyle: const ToggleIconStyle(
                innerColor: Colors.orange,
                innerOpacity: 1,
              ),
            ),
            outerIcon: Icons.account_tree_outlined,
            innerIcon: Icons.account_tree,
          ),
        ),
      ],
    );
  },
)''';
