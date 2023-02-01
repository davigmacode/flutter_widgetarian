import 'package:flutter/material.dart';
import 'package:widgetarian/navigation.dart';

import '../../sample.dart';

class AnchorCircleUsage extends StatelessWidget {
  const AnchorCircleUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Circle Shape',
      script: script,
      children: [
        Anchor.circle(
          onTap: () {},
          radius: 20,
          child: const Icon(Icons.chat),
        ),
      ],
    );
  }
}

const script = '''Anchor.circle(
  onTap: () {},
  radius: 20,
  child: const Icon(Icons.chat),
)''';
