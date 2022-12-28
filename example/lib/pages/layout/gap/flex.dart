import 'package:flutter/material.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class GapFlexUsage extends StatelessWidget {
  const GapFlexUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).colorScheme.primaryContainer;
    final fgColor = Theme.of(context).colorScheme.onPrimaryContainer;

    return Sample(
      title: 'With Flex Usage',
      script: script,
      children: [
        DefaultTextStyle(
          style: TextStyle(color: fgColor),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Box(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                color: bgColor,
                child: const Text('content'),
              ),
              const Gap(10),
              Box(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                color: bgColor,
                child: const Text('content'),
              ),
              const Gap(10),
              Box(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                color: bgColor,
                child: const Text('content'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const script = '''Flex(
  direction: Axis.horizontal,
  children: [
    Box(
      width: 70,
      height: 70,
      alignment: Alignment.center,
      color: bgColor,
      child: const Text('content'),
    ),
    const Gap(10),
    Box(
      width: 70,
      height: 70,
      alignment: Alignment.center,
      color: bgColor,
      child: const Text('content'),
    ),
    const Gap(10),
    Box(
      width: 70,
      height: 70,
      alignment: Alignment.center,
      color: bgColor,
      child: const Text('content'),
    ),
  ],
)''';
