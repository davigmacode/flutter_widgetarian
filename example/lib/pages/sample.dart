import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/typography.dart';

class Sample extends StatelessWidget {
  const Sample({
    Key? key,
    this.wrapped = true,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    required this.title,
    required this.script,
    required this.children,
  }) : super(key: key);

  final bool wrapped;
  final String title;
  final String script;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final child = wrapped
        ? Wrap(
            spacing: 15,
            runSpacing: 15,
            children: children,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: children,
          );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineText.large(title),
          const Gap(15),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Expansion(
              header: ExpansionConsumer(builder: (context, state, _) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Center(child: child),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        splashRadius: 18,
                        icon: const Icon(Icons.code),
                        onPressed: state.toggle,
                      ),
                    ),
                  ],
                );
              }),
              child: SizedBox(
                width: double.infinity,
                child: HighlightView(
                  script,
                  language: 'dart',
                  theme: darculaTheme,
                  padding: const EdgeInsets.all(12),
                  textStyle: GoogleFonts.robotoMono(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
