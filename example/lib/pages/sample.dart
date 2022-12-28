import 'package:flutter/material.dart' hide ListTile;
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
    this.script,
    this.options,
    required this.title,
    required this.children,
  }) : super(key: key);

  final bool wrapped;
  final String? script;
  final Widget? options;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    Widget child = wrapped
        ? Wrap(
            spacing: 30,
            runSpacing: 15,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: children,
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: children,
          );

    Widget? scriptToggle;
    if (script != null) {
      scriptToggle = options == null
          ? const Align(
              alignment: Alignment.topRight,
              child: ExpansionButton(
                style: ExpansionButtonStyle(
                  shape: BoxShape.circle,
                  radius: 18,
                ),
                child: Icon(Icons.code),
              ),
            )
          : const ExpansionButton(
              child: ListTile(
                spacing: 10,
                margin: EdgeInsets.all(10),
                leading: Icon(Icons.code),
                title: Text('Source Code'),
              ),
            );
    }

    child = options == null
        ? Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Center(child: child),
              ),
              scriptToggle,
            ].whereType<Widget>().toList(),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Center(child: child),
                ),
              ),
              Box(
                color: Colors.black12,
                width: 200,
                child: Column(
                  children: [
                    options,
                    scriptToggle,
                  ].whereType<Widget>().toList(),
                ),
              ),
            ],
          );

    if (script != null) {
      child = Expansion(
        value: false,
        header: child,
        child: SizedBox(
          width: double.infinity,
          child: HighlightView(
            script!,
            language: 'dart',
            theme: darculaTheme,
            padding: const EdgeInsets.all(12),
            textStyle: GoogleFonts.robotoMono(),
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadlineText.large(title),
          const Gap(15),
          Card(
            clipBehavior: Clip.antiAlias,
            child: child,
          ),
        ],
      ),
    );
  }
}
