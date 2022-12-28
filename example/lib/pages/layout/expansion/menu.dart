import 'package:flutter/material.dart' hide ListTile;
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ExpansionMenuUsage extends StatelessWidget {
  const ExpansionMenuUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Expansion Menu',
      script: script,
      wrapped: false,
      children: [
        SizedBox(
          width: 500,
          child: Expansion(
            value: false,
            // divider: Divider(),
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
                  // divider: Divider(),
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
      ],
    );
  }
}

const script = '''Anchor(
  onTap: () {},
  shape: BoxShape.circle,
  radius: 20,
  child: const Icon(Icons.chat),
)''';
