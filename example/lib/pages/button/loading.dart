import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/button.dart';
import 'package:widgetarian/event.dart';

import '../sample.dart';

class ButtonLoadingUsage extends StatefulWidget {
  const ButtonLoadingUsage({Key? key}) : super(key: key);

  @override
  State<ButtonLoadingUsage> createState() => _ButtonLoadingUsageState();
}

class _ButtonLoadingUsageState extends State<ButtonLoadingUsage> {
  bool loading = false;

  void setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  void load() {
    setLoading(true);
    Future.delayed(const Duration(seconds: 3), () {
      setLoading(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Loading Button',
      script: script,
      children: [
        Button(
          loading: loading,
          onPressed: load,
          style: ButtonStyle.flat(),
          leading: DrivenWidget.by((events) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: ButtonEvent.isLoading(events)
                  ? const CircularProgressIndicator()
                  : Container(),
            );
          }),
          child: DrivenWidget.by((events) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: ButtonEvent.isLoading(events)
                  ? const Text('Loading..', key: ValueKey('loading'))
                  : ButtonEvent.isHovered(events)
                      ? const Text('Hovered', key: ValueKey('hovered'))
                      : const Text(
                          'Enabled',
                          key: ValueKey('enabled'),
                        ),
            );
          }),
        ),
        Button(
          onPressed: () => {},
          style: ButtonStyle.toned(),
          trailing: const Icon(Icons.close),
          child: const Text('Toned Button'),
        ),
        Button(
          onPressed: () => {},
          style: ButtonStyle.outlined(),
          leading: const Icon(Icons.calendar_month),
          trailing: const Icon(Icons.close),
          child: const Text('Outlined Button'),
        ),
        Button(
          onPressed: () => {},
          style: ButtonStyle.filled(),
          leading: const SizedBox.square(
            dimension: 18,
            child: CircularProgressIndicator(),
          ),
          child: const Text('Filled Button'),
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
