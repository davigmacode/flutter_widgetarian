import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/navigation.dart';

import '../../sample.dart';

class AnchorRectangleUsage extends StatelessWidget {
  const AnchorRectangleUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Rectangle Shape',
      script: script,
      children: [
        Anchor(
          onTap: () {},
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 6,
          ),
          borderRadius: BorderRadius.circular(5),
          child: const Text('Click Here'),
        ),
      ],
    );
  }
}

const script = '''Anchor(
  onTap: () {},
  padding: const EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 6,
  ),
  borderRadius: BorderRadius.circular(5),
  child: const Text('Click Here'),
)''';
