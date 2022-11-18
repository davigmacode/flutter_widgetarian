import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/typography.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/display.dart';

import '../../sample.dart';

class AvatarBasicUsage extends StatelessWidget {
  const AvatarBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineText.large('Basic Usage'),
          const Gap.size(15),
          Sample(
            script: script,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: const [
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
                ),
              ),
            ),
          ),
        ],
      ),
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
