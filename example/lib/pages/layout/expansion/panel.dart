import 'package:flutter/material.dart';
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ExpansionPanelUsage extends StatefulWidget {
  const ExpansionPanelUsage({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelUsage> createState() => _ExpansionPanelUsageState();
}

class _ExpansionPanelUsageState extends State<ExpansionPanelUsage> {
  @override
  Widget build(BuildContext context) {
    return const Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        SizedBox(
          width: 500,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Expansion(
                value: true,
                header: ExpansionHeader(
                  title: Text('What is Lorem Ipsum?'),
                  trailing: ExpansionIcon(),
                ),
                divider: Divider(),
                child: ExpansionScrollView(
                  constraints: BoxConstraints(maxHeight: 100),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                ),
              ),
            ),
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
