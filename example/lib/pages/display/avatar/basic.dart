import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/display.dart';

import '../../sample.dart';

class AvatarBasicUsage extends StatelessWidget {
  const AvatarBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        Avatar(
          style: AvatarStyle(
            elevation: 5.0,
          ),
          image: NetworkImage('https://i.pravatar.cc/50'),
        ),
        Avatar(
          style: AvatarStyle(
            size: 40,
            backgroundColor: Colors.red,
            foregroundStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
            shape: BoxShape.rectangle,
          ),
          child: Text('LF'),
        ),
        Avatar(
          style: AvatarStyle(
            size: 40,
            elevation: 2,
            backgroundColor: Colors.red,
            foregroundStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          child: Icon(Icons.person),
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
