import 'package:flutter/material.dart' hide ListTile, ListTileStyle;
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class ExpansionPanelUsage extends StatelessWidget {
  const ExpansionPanelUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Sample(
      title: 'Expansion Panel',
      script: script,
      wrapped: false,
      children: [
        SizedBox(
          width: 500,
          child: Expansion(
            value: true,
            header: ExpansionHeader(
              title: Text('What is Lorem Ipsum?'),
              trailing: ExpansionIcon(),
              buttonStyle: ExpansionButtonStyle(
                overlayDisabled: true,
              ),
            ),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            ),
          ),
        ),
        Gap(20),
        SizedBox(
          width: 500,
          child: Expansion(
            value: false,
            header: ListTile(
              title: Text('What is Lorem Ipsum?'),
              trailing: ExpansionButton(
                style: ExpansionButtonStyle(
                  shape: BoxShape.circle,
                  radius: 16,
                ),
                child: ExpansionIcon(
                  icon: Icons.arrow_drop_down_rounded,
                ),
              ),
            ),
            divider: Divider(),
            collapsed: Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
            ),
            child: ExpansionView(
              maxHeight: 100,
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

const script = '''Column(
  children: [
    SizedBox(
      width: 500,
      child: Expansion(
        value: true,
        header: ExpansionHeader(
          title: Text('What is Lorem Ipsum?'),
          trailing: ExpansionIcon(),
          buttonStyle: ExpansionButtonStyle(
            overlayDisabled: true,
          ),
        ),
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        ),
      ),
    ),
    Gap(20),
    SizedBox(
      width: 500,
      child: Expansion(
        value: false,
        header: ListTile(
          title: Text('What is Lorem Ipsum?'),
          trailing: ExpansionButton(
            style: ExpansionButtonStyle(
              shape: BoxShape.circle,
              radius: 16,
            ),
            child: ExpansionIcon(
              icon: Icons.arrow_drop_down_rounded,
            ),
          ),
        ),
        divider: Divider(),
        collapsed: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          maxLines: 2,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
        ),
        child: ExpansionView(
          maxHeight: 100,
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
          ),
        ),
      ),
    ),
  ],
)''';
