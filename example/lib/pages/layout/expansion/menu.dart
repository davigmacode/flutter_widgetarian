import 'package:flutter/material.dart' hide ListTile;
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ExpansionMenuUsage extends StatefulWidget {
  const ExpansionMenuUsage({Key? key}) : super(key: key);

  @override
  State<ExpansionMenuUsage> createState() => _ExpansionMenuUsageState();
}

class _ExpansionMenuUsageState extends State<ExpansionMenuUsage> {
  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Basic Usage',
      script: script,
      children: [
        SizedBox(
          width: 500,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Expansion(
                header: const ExpansionHeader(
                  title: Text('Menu'),
                  trailing: ExpansionIcon(),
                ),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: const Text('Menu Item'),
                      onTap: () {},
                    ),
                    ListTile(
                      title: const Text('Menu Item'),
                      onTap: () {},
                    ),
                    Expansion(
                      header: const ExpansionHeader(
                        title: Text('Nested Menu'),
                        trailing: ExpansionIcon(),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ListTile(
                              title: const Text('Menu Item'),
                              onTap: () {},
                            ),
                            ListTile(
                              title: const Text('Menu Item'),
                              onTap: () {},
                            ),
                            Expansion(
                              header: const ExpansionHeader(
                                title: Text('Nested Menu'),
                                trailing: ExpansionIcon(),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: ListView(
                                  shrinkWrap: true,
                                  children: [
                                    ListTile(
                                      title: const Text('Menu Item'),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      title: const Text('Menu Item'),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
