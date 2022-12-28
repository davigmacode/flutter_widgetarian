import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/anchor.dart';
import 'package:widgetarian/display.dart';

import '../../sample.dart';

class SpoilerBasicUsage extends StatelessWidget {
  const SpoilerBasicUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Sample(
      title: 'Basic Usage',
      script: script,
      wrapped: false,
      children: [
        SizedBox(
          width: 500,
          child: Spoiler(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            trimLength: 200,
            trimLines: 5,
          ),
        ),
        // RichText(
        //   text: TextSpan(
        //     children: [
        //       const TextSpan(
        //         text:
        //             "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        //       ),
        //       WidgetSpan(
        //         child: Anchor(
        //           onTap: () {},
        //           borderRadius: BorderRadius.circular(5),
        //           padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        //           child: const Text('..More'),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

const script = '''SizedBox(
  width: 500,
  child: Spoiler(
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    trimLength: 200,
    trimLines: 5,
  ),
)''';
