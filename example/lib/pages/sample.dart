import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/darcula.dart';
import 'package:google_fonts/google_fonts.dart';

class Sample extends StatefulWidget {
  const Sample({
    Key? key,
    required this.script,
    required this.child,
  }) : super(key: key);

  final String script;
  final Widget child;

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  bool showScript = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      // decoration: BoxDecoration(
      //   border: Border.all(
      //     color: Colors.black54,
      //     width: 2,
      //   ),
      //   borderRadius: BorderRadius.circular(5),
      // ),
      // width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.child,
          const Divider(height: 1),
          Row(
            children: [
              const Spacer(),
              IconButton(
                splashRadius: 18,
                icon: const Icon(Icons.code),
                onPressed: () => setState(() {
                  showScript = !showScript;
                }),
              ),
            ],
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: SizedBox(
              width: double.infinity,
              child: HighlightView(
                widget.script,
                language: 'dart',
                theme: darculaTheme,
                padding: const EdgeInsets.all(12),
                textStyle: GoogleFonts.robotoMono(),
              ),
            ),
            crossFadeState: showScript
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
