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
          style: AvatarStyle(elevation: 5.0),
          image: NetworkImage('https://i.pravatar.cc/50?u=1'),
        ),
        Avatar(
          style: AvatarStyle(
            shape: BoxShape.rectangle,
            elevation: 5.0,
            size: 60,
          ),
          image: NetworkImage('https://i.pravatar.cc/50?u=2'),
        ),
        Avatar(
          style: AvatarStyle(
            size: 50,
            shape: BoxShape.rectangle,
            backgroundColor: Colors.red,
            foregroundStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          child: Text('LF'),
        ),
        Avatar(
          style: AvatarStyle(
            size: 70,
            elevation: 2,
            backgroundColor: Colors.red,
            foregroundStyle: TextStyle(
              fontSize: 40,
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
    Avatar(
      style: AvatarStyle(elevation: 5.0),
      image: NetworkImage('https://i.pravatar.cc/50?u=1'),
    ),
    Avatar(
      style: AvatarStyle(
        shape: BoxShape.rectangle,
        elevation: 5.0,
        size: 60,
      ),
      image: NetworkImage('https://i.pravatar.cc/50?u=2'),
    ),
    Avatar(
      style: AvatarStyle(
        size: 50,
        shape: BoxShape.rectangle,
        backgroundColor: Colors.red,
        foregroundStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
      child: Text('LF'),
    ),
    Avatar(
      style: AvatarStyle(
        size: 70,
        elevation: 2,
        backgroundColor: Colors.red,
        foregroundStyle: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
      child: Icon(Icons.person),
    ),
  ],
)''';
