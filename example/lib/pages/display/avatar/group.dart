import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/typography.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/display.dart';
import 'package:widgetarian/group.dart';

import '../../sample.dart';

class AvatarGroupUsage extends StatefulWidget {
  const AvatarGroupUsage({Key? key}) : super(key: key);

  @override
  State<AvatarGroupUsage> createState() => _AvatarGroupUsageState();
}

class _AvatarGroupUsageState extends State<AvatarGroupUsage> {
  final _minWidth = 88.0;
  final _maxWidth = 500.0;
  double _width = 500.0;

  void _setWidth(double value) {
    setState(() {
      _width = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeadlineText.large('Grouped Usage'),
          const Gap.size(15),
          Sample(
            script: script,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      color: Colors.black12,
                      width: _width,
                      child: StackedGroup(
                        minCoverage: 0.5,
                        maxCoverage: 0.8,
                        align: StackedAlign.center,
                        itemLead: 3,
                        itemSize: const Size.square(44),
                        // itemLimit: 10,
                        itemLength: 15,
                        itemBuilder: (context, i) {
                          return Box(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            padding: const EdgeInsets.all(2.0),
                            child: Avatar(
                              style: const AvatarStyle(
                                size: 40,
                                foregroundStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              image:
                                  NetworkImage('https://i.pravatar.cc/50?u=$i'),
                              child: Text(i.toString()),
                            ),
                          );
                        },
                        infoBuilder: (context, remaining) {
                          return Box(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            padding: const EdgeInsets.all(2.0),
                            child: Avatar(
                              style: const AvatarStyle(
                                backgroundColor: Colors.red,
                                foregroundStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              child: Text('+$remaining'),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        return Slider(
                          value: _width,
                          min: constraints.minWidth,
                          max: constraints.maxWidth,
                          onChanged: _setWidth,
                        );
                      },
                    )
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
