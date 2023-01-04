import 'package:flutter/material.dart' hide Overlay;
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class SheetCircleUsage extends StatelessWidget {
  const SheetCircleUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Sample(
      title: 'Circle Shape',
      script: script,
      children: [
        Sheet(
          style: SheetStyle.tonal(
            shape: BoxShape.circle,
            width: 100,
            height: 100,
          ),
          child: Center(child: Text('Tonal')),
        ),
        Sheet(
          style: SheetStyle.elevated(
            shape: BoxShape.circle,
            width: 100,
            height: 100,
          ),
          child: Center(child: Text('Elevated')),
        ),
        Sheet(
          style: SheetStyle.filled(
            shape: BoxShape.circle,
            width: 100,
            height: 100,
          ),
          child: Center(child: Text('Filled')),
        ),
        Sheet(
          style: SheetStyle.outlined(
            shape: BoxShape.circle,
            width: 100,
            height: 100,
          ),
          child: Center(child: Text('Outlined')),
        ),
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    Sheet(
      style: SheetStyle.tonal(
        shape: BoxShape.circle,
        width: 100,
        height: 100,
      ),
      child: Center(child: Text('Tonal')),
    ),
    Sheet(
      style: SheetStyle.elevated(
        shape: BoxShape.circle,
        width: 100,
        height: 100,
      ),
      child: Center(child: Text('Elevated')),
    ),
    Sheet(
      style: SheetStyle.filled(
        shape: BoxShape.circle,
        width: 100,
        height: 100,
      ),
      child: Center(child: Text('Filled')),
    ),
    Sheet(
      style: SheetStyle.outlined(
        shape: BoxShape.circle,
        width: 100,
        height: 100,
      ),
      child: Center(child: Text('Outlined')),
    ),
  ],
)''';
