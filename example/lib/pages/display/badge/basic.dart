import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/display.dart';

import '../../sample.dart';

class BadgeBasicUsage extends StatelessWidget {
  const BadgeBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        const Badge(
          alignment: Alignment.topRight,
          offset: Offset(15, -5),
          style: BadgeStyle(
            padding: EdgeInsets.all(3),
            backgroundColor: Colors.red,
          ),
          content: '2452',
          child: Icon(Icons.chat),
        ),
        const Badge(
          alignment: Alignment.topRight,
          offset: Offset(15, -5),
          style: BadgeStyle(
            padding: EdgeInsets.fromLTRB(4, 3, 4, 3),
            backgroundColor: Colors.red,
          ),
          content: 'New',
          child: Icon(Icons.notifications),
        ),
        Badge(
          alignment: Alignment.bottomRight,
          offset: const Offset(-1, 2),
          style: BadgeStyle.circle(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            borderStyle: BorderStyle.solid,
            borderColor: Theme.of(context).cardColor,
            borderOpacity: 1,
            borderWidth: 2,
            size: 12,
          ),
          child: const Avatar(
            image: NetworkImage('https://i.pravatar.cc/50?u=1'),
          ),
        ),
        Badge(
          alignment: Alignment.bottomCenter,
          offset: const Offset(0, 5),
          style: BadgeStyle(
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
            borderStyle: BorderStyle.solid,
            borderColor: Theme.of(context).cardColor,
            borderOpacity: 1,
            borderWidth: 2,
          ),
          content: '247',
          child: const Avatar(
            image: NetworkImage('https://i.pravatar.cc/50?u=2'),
          ),
        ),
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    const Badge(
      alignment: Alignment.topRight,
      offset: Offset(15, -5),
      style: BadgeStyle(
        padding: EdgeInsets.all(3),
        backgroundColor: Colors.red,
      ),
      content: '2452',
      child: Icon(Icons.chat),
    ),
    const Badge(
      alignment: Alignment.topRight,
      offset: Offset(15, -5),
      style: BadgeStyle(
        padding: EdgeInsets.fromLTRB(4, 3, 4, 3),
        backgroundColor: Colors.red,
      ),
      content: 'New',
      child: Icon(Icons.notifications),
    ),
    Badge(
      alignment: Alignment.bottomRight,
      offset: const Offset(-1, 2),
      style: BadgeStyle.circle(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        borderStyle: BorderStyle.solid,
        borderColor: Theme.of(context).cardColor,
        borderOpacity: 1,
        borderWidth: 2,
        size: 12,
      ),
      child: const Avatar(
        image: NetworkImage('https://i.pravatar.cc/50?u=1'),
      ),
    ),
    Badge(
      alignment: Alignment.bottomCenter,
      offset: const Offset(0, 5),
      style: BadgeStyle(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        borderStyle: BorderStyle.solid,
        borderColor: Theme.of(context).cardColor,
        borderOpacity: 1,
        borderWidth: 2,
      ),
      content: '247',
      child: const Avatar(
        image: NetworkImage('https://i.pravatar.cc/50?u=2'),
      ),
    ),
  ],
)''';
