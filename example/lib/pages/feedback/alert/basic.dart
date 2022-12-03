import 'package:flutter/material.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/feedback.dart';

import '../../sample.dart';

class AlertBasicUsage extends StatefulWidget {
  const AlertBasicUsage({Key? key}) : super(key: key);

  @override
  State<AlertBasicUsage> createState() => _AlertBasicUsageState();
}

class _AlertBasicUsageState extends State<AlertBasicUsage> {
  bool _open = true;

  void _setOpen(bool? value) {
    setState(() {
      _open = value ?? !_open;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Basic Usage',
      script: script,
      wrapped: false,
      children: [
        Expansion(
          value: _open,
          onChanged: _setOpen,
          child: Alert(
            style: const SheetStyle().toned(
              // color: Colors.orange,
              foregroundColor: Colors.orange,
              backgroundColor: Colors.orange,
              // color: Theme.of(context).cardColor,
              padding: const EdgeInsets.all(20),
              // borderRadius: BorderRadius.zero,
              // elevation: 2,
              // width: double.infinity,
            ),
            icon: const Icon(Icons.warning),
            action: const ExpansionButton(
              child: Icon(Icons.close),
            ),
            title: const Text('Warning'),
            child: const Text('This is a warning alert — check it out!'),
          ),
        ),
        const Gap(20),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _open
              ? Alert(
                  style: const SheetStyle().toned(
                    // color: Colors.orange,
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.orange,
                    // color: Theme.of(context).cardColor,
                    padding: const EdgeInsets.all(20),
                    // borderRadius: BorderRadius.zero,
                    // elevation: 2,
                    // width: double.infinity,
                  ),
                  icon: const Icon(Icons.warning),
                  action: const Icon(Icons.close),
                  title: const Text('Warning'),
                  child: const Text('This is a warning alert — check it out!'),
                )
              : Container(),
        ),
        const Gap(20),
        Button(
          onPressed: () => _setOpen(null),
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
