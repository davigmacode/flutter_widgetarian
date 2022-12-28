import 'package:flutter/material.dart' hide ListTile;
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class GapListUsage extends StatelessWidget {
  const GapListUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.primaryContainer;
    final fgColor = Theme.of(context).colorScheme.onPrimaryContainer;
    return Sample(
      title: 'With ListView Usage',
      script: script,
      children: [
        Box(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (_, i) => Box(
              alignment: Alignment.center,
              color: bgColor,
              width: 100,
              child: Text(
                'content',
                style: TextStyle(color: fgColor),
              ),
            ),
            separatorBuilder: (_, i) => const Gap(10),
          ),
        ),
      ],
    );
  }
}

const script = '''Box(
  height: 100,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    shrinkWrap: true,
    itemCount: 3,
    itemBuilder: (_, i) => Box(
      alignment: Alignment.center,
      color: bgColor,
      width: 100,
      child: Text(
        'content',
        style: TextStyle(color: fgColor),
      ),
    ),
    separatorBuilder: (_, i) => const Gap(10),
  ),
)''';
