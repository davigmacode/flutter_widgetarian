import 'package:flutter/material.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/text.dart';

import '../../sample.dart';

class ExpansionTextUsage extends StatelessWidget {
  const ExpansionTextUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Expansion Text',
      script: script,
      wrapped: false,
      children: [
        SizedBox(
          width: 500,
          child: Expansion(
            value: false,
            collapsed: const ExpansionButton(
              child: ConstrainedText(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                maxLines: 2,
                ellipsis: TextSpan(text: '...Show more'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                Gap(10),
                ExpansionButton(
                  child: Text(
                    'Show less',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
