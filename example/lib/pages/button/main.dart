import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/button.dart';
import 'dart:developer';

import '../template.dart';
import 'basic.dart';
import 'child.dart';
import 'event.dart';
import 'icon.dart';
import 'block.dart';
import 'loading.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  void initState() {
    const style = ButtonStyle(margin: EdgeInsets.all(5));
    log('${style.margin}', name: 'style initial');

    final merged = style.merge(ButtonStyle.outlined(
      margin: EdgeInsets.zero,
      pressedStyle: const ButtonStyle(
        margin: EdgeInsets.all(10),
      ),
    ));
    log('${merged.margin}', name: 'style merged');

    final evaluated = ButtonStyle.evaluate(merged, {ButtonEvent.pressed});
    log('${evaluated?.margin}', name: 'style pressed');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const [
          ButtonBasicUsage(),
          ButtonChildUsage(),
          ButtonEventUsage(),
          ButtonIconUsage(),
          ButtonBlockUsage(),
          ButtonLoadingUsage(),
        ],
      ),
    );
  }
}
