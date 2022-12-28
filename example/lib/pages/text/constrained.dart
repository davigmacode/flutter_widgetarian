import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/text.dart';
import 'package:widgetarian/typography.dart';

import '../sample.dart';

class TextConstrainedUsage extends StatelessWidget {
  const TextConstrainedUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Constrained Text',
      script: script,
      wrapped: false,
      children: [
        const TitleText.small(
            'Trim by max length or max lines, and custom ellipsis widget'),
        const Gap(5),
        const SizedBox(
          width: 500,
          child: ConstrainedText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            maxLength: 300,
            maxLines: 4,
            ellipsis: TextSpan(children: [
              TextSpan(text: '...'),
              TextSpan(
                text: 'Show More',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
        const Gap(20),
        const TitleText.small('Min lines'),
        const Gap(5),
        Container(
          width: 500,
          color: Colors.black12,
          child: const ConstrainedText(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            minLines: 7,
          ),
        ),
      ],
    );
  }
}

const script = '''ListView(
  children: [
    const TitleText.small('Trim by max length or max lines, and custom ellipsis widget'),
    const Gap(5),
    const SizedBox(
      width: 500,
      child: ConstrainedText(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        maxLength: 300,
        maxLines: 4,
        trailing: TextSpan(children: [
          TextSpan(text: '...'),
          TextSpan(
            text: 'Show More',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    ),
    const Gap(20),
    const TitleText.small('Min lines'),
    const Gap(5),
    Container(
      width: 500,
      color: Colors.black12,
      child: const ConstrainedText(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
        minLines: 7,
      ),
    ),
  ],
)''';
