import 'package:flutter/material.dart';
import 'package:widgetarian/display.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/navigation.dart';

import '../../sample.dart';

class BadgeAnimatedUsage extends StatefulWidget {
  const BadgeAnimatedUsage({Key? key}) : super(key: key);

  @override
  State<BadgeAnimatedUsage> createState() => _BadgeAnimatedUsageState();
}

class _BadgeAnimatedUsageState extends State<BadgeAnimatedUsage> {
  int count = 0;

  void decrement() {
    setState(() {
      if (count > 0) count -= 1;
    });
  }

  void increment() {
    setState(() {
      count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Animated Usage',
      script: script,
      children: [
        Anchor(
          radius: 20,
          shape: BoxShape.circle,
          onTap: decrement,
          child: const Icon(Icons.remove_circle_outline),
        ),
        Badge(
          hidden: count == 0,
          alignment: Alignment.topRight,
          offset: const Offset(8, -8),
          style: const BadgeStyle.circle(
            alignment: Alignment.center,
            backgroundColor: Colors.red,
            backgroundOpacity: 1,
            size: 19,
          ),
          content: count.toString(),
          transitionBuilder: BadgeTransition.scale,
          child: const Icon(Icons.chat),
        ),
        Anchor(
          radius: 20,
          shape: BoxShape.circle,
          onTap: increment,
          child: const Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}

const script = '''int count = 0;

void decrement() {
  setState(() {
    if (count > 0) count -= 1;
  });
}

void increment() {
  setState(() {
    count += 1;
  });
}

Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    Anchor(
      radius: 20,
      shape: BoxShape.circle,
      onTap: decrement,
      child: const Icon(Icons.remove_circle_outline),
    ),
    Badge(
      hidden: count == 0,
      alignment: Alignment.topRight,
      offset: const Offset(8, -8),
      style: const BadgeStyle.circle(
        alignment: Alignment.center,
        backgroundColor: Colors.red,
        backgroundOpacity: 1,
        size: 19,
      ),
      content: count.toString(),
      transitionBuilder: BadgeTransition.scale,
      child: const Icon(Icons.chat),
    ),
    Anchor(
      radius: 20,
      shape: BoxShape.circle,
      onTap: increment,
      child: const Icon(Icons.add_circle_outline),
    ),
  ],
)''';
