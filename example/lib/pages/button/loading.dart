import 'package:flutter/material.dart' hide ButtonStyle, TextButton;
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
        TextButton(
          loading: loading,
          onPressed: load,
          leading: DrivenWidget.by((events) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: ButtonEvent.isLoading(events)
                  ? const SizedBox.square(
                      dimension: 18,
                      child: CircularProgressIndicator(),
                    )
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
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    TextButton(
      loading: loading,
      onPressed: load,
      leading: DrivenWidget.by((events) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: ButtonEvent.isLoading(events)
              ? const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(),
                )
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
  ],
)''';
