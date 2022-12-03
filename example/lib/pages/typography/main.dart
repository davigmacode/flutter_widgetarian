import 'package:flutter/material.dart' hide ListTile, Spacer;
import 'package:widgetarian/typography.dart';
import '../template.dart';
import '../sample.dart';

const script = '''Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: const [
    DisplayText.large('Display Large'),
    DisplayText('Display Medium'),
    DisplayText.small('Display Small'),
    HeadlineText.large('Headline Large'),
    HeadlineText('Headline Medium'),
    HeadlineText.small('Headline Small'),
    HeadlineText.h1('Heading 1'),
    HeadlineText.h2('Heading 2'),
    HeadlineText.h3('Heading 3'),
    HeadlineText.h4('Heading 4'),
    HeadlineText.h5('Heading 5'),
    HeadlineText.h6('Heading 6'),
    TitleText.large('Title Large'),
    TitleText('Title Medium'),
    TitleText.small('Title Small'),
    SubtitleText('Subtitle'),
    SubtitleText.small('Subtitle Small'),
    BodyText.large('Body Large'),
    BodyText('Body Medium'),
    BodyText.small('Body Small'),
    ButtonText('Button'),
    CaptionText('Caption'),
    OverlineText('Overline'),
  ],
)''';

class TypographyPage extends StatefulWidget {
  const TypographyPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<TypographyPage> createState() => _TypographyPageState();
}

class _TypographyPageState extends State<TypographyPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const [
          Sample(
            title: 'Typography',
            script: script,
            wrapped: false,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DisplayText.large('Display Large'),
              DisplayText('Display Medium'),
              DisplayText.small('Display Small'),
              HeadlineText.large('Headline Large'),
              HeadlineText('Headline Medium'),
              HeadlineText.small('Headline Small'),
              HeadlineText.h1('Heading 1'),
              HeadlineText.h2('Heading 2'),
              HeadlineText.h3('Heading 3'),
              HeadlineText.h4('Heading 4'),
              HeadlineText.h5('Heading 5'),
              HeadlineText.h6('Heading 6'),
              TitleText.large('Title Large'),
              TitleText('Title Medium'),
              TitleText.small('Title Small'),
              SubtitleText('Subtitle'),
              SubtitleText.small('Subtitle Small'),
              BodyText.large('Body Large'),
              BodyText('Body Medium'),
              BodyText.small('Body Small'),
              ButtonText('Button'),
              CaptionText('Caption'),
              OverlineText('Overline'),
            ],
          ),
        ],
      ),
    );
  }
}
