import 'package:flutter/material.dart';
import 'package:widgetarian/anchor.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/feedback.dart';

import '../../sample.dart';

class AlertClosableUsage extends StatefulWidget {
  const AlertClosableUsage({Key? key}) : super(key: key);

  @override
  State<AlertClosableUsage> createState() => _AlertClosableUsageState();
}

class _AlertClosableUsageState extends State<AlertClosableUsage> {
  bool _open = true;

  void _setOpen([bool? value]) {
    setState(() {
      _open = value ?? !_open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Closable Usage',
      script: script,
      wrapped: false,
      children: [
        Expansion(
          value: _open,
          onChanged: _setOpen,
          child: const Alert(
            style: AlertStyle.tonal(
              foregroundColor: Colors.orange,
              backgroundColor: Colors.orange,
              padding: EdgeInsets.all(20),
            ),
            icon: Icon(Icons.warning),
            action: ExpansionButton(
              style: ExpansionButtonStyle(
                shape: BoxShape.circle,
                radius: 20,
              ),
              child: Icon(Icons.close),
            ),
            title: Text('Warning'),
            message: Text('This is a warning alert — check it out!'),
          ),
        ),
        const Gap(20),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _open
              ? Alert(
                  style: const AlertStyle.tonal(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.all(20),
                  ),
                  icon: const Icon(Icons.warning),
                  action: Anchor(
                    radius: 20,
                    onTap: _setOpen,
                    shape: BoxShape.circle,
                    child: const Icon(Icons.close),
                  ),
                  title: const Text('Warning'),
                  message:
                      const Text('This is a warning alert — check it out!'),
                )
              : Container(),
        ),
        const Gap(20),
        Button(
          onPressed: _setOpen,
          child: const Text('Toggle Open'),
        ),
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    Button(
      onPressed: () => {},
      style: ButtonStyle.flat(),
      child: const Text('Flat Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.toned(),
      child: const Text('Toned Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.outlined(),
      child: const Text('Outlined Button'),
    ),
    Button(
      onPressed: () => {},
      style: ButtonStyle.filled(),
      child: const Text('Filled Button'),
    ),
  ],
)''';
