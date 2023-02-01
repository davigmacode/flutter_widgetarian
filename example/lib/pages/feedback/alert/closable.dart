import 'package:flutter/material.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/feedback.dart';

import '../../sample.dart';

class AlertClosableUsage extends StatefulWidget {
  const AlertClosableUsage({Key? key}) : super(key: key);

  @override
  State<AlertClosableUsage> createState() => _AlertClosableUsageState();
}

class _AlertClosableUsageState extends State<AlertClosableUsage> {
  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Closable Usage',
      script: script,
      wrapped: false,
      children: [
        Choice<String>(
          value: const ['danger', 'warning', 'success', 'info'],
          items: const ['danger', 'warning', 'success', 'info'],
          multiple: true,
          builder: (context, group, _) {
            return Column(
              children: [
                Alert.danger(
                  visible: group.has('danger'),
                  onChanged: group.select('danger'),
                  title: const Text('Danger'),
                  message: const Text('This is a danger alert — check it out!'),
                  action: const AlertClose.circle(
                    radius: 20,
                    child: Icon(Icons.close),
                  ),
                ),
                const Gap(20),
                Alert.warning(
                  visible: group.has('warning'),
                  onChanged: group.select('warning'),
                  transitionBuilder: AlertTransition.fade,
                  title: const Text('Warning'),
                  message:
                      const Text('This is a warning alert — check it out!'),
                  action: const AlertClose.circle(
                    radius: 20,
                    child: Icon(Icons.close),
                  ),
                ),
                const Gap(20),
                Alert.success(
                  visible: group.has('success'),
                  onChanged: group.select('success'),
                  transitionBuilder: AlertTransition.scale,
                  title: const Text('Success'),
                  message:
                      const Text('This is a success alert — check it out!'),
                  action: const AlertClose.circle(
                    radius: 20,
                    child: Icon(Icons.close),
                  ),
                ),
                const Gap(20),
                Alert.info(
                  visible: group.has('info'),
                  onChanged: group.select('info'),
                  title: const Text('Info'),
                  message: const Text('This is a info alert — check it out!'),
                  action: const AlertClose.circle(
                    radius: 20,
                    child: Icon(Icons.close),
                  ),
                ),
                const Gap(20),
                Wrap(
                  spacing: 15,
                  children: [
                    Button(
                      onPressed: () => group.fill(),
                      child: const Text('Open All'),
                    ),
                    Button(
                      onPressed: () => group.clear(),
                      child: const Text('Close All'),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

const script = '''Choice<String>(
  value: const ['danger', 'warning', 'success', 'info'],
  items: const ['danger', 'warning', 'success', 'info'],
  multiple: true,
  builder: (context, group, _) {
    return Column(
      children: [
        Alert.danger(
          visible: group.has('danger'),
          onChanged: group.select('danger'),
          title: const Text('Danger'),
          message: const Text('This is a danger alert — check it out!'),
          action: const AlertClose.circle(
            radius: 20,
            child: Icon(Icons.close),
          ),
        ),
        const Gap(20),
        Alert.warning(
          visible: group.has('warning'),
          onChanged: group.select('warning'),
          transitionBuilder: AlertTransition.fade,
          title: const Text('Warning'),
          message:
              const Text('This is a warning alert — check it out!'),
          action: const AlertClose.circle(
            radius: 20,
            child: Icon(Icons.close),
          ),
        ),
        const Gap(20),
        Alert.success(
          visible: group.has('success'),
          onChanged: group.select('success'),
          transitionBuilder: AlertTransition.scale,
          title: const Text('Success'),
          message:
              const Text('This is a success alert — check it out!'),
          action: const AlertClose.circle(
            radius: 20,
            child: Icon(Icons.close),
          ),
        ),
        const Gap(20),
        Alert.info(
          visible: group.has('info'),
          onChanged: group.select('info'),
          title: const Text('Info'),
          message: const Text('This is a info alert — check it out!'),
          action: const AlertClose.circle(
            radius: 20,
            child: Icon(Icons.close),
          ),
        ),
        const Gap(20),
        Wrap(
          spacing: 15,
          children: [
            Button(
              onPressed: () => group.fill(),
              child: const Text('Open All'),
            ),
            Button(
              onPressed: () => group.clear(),
              child: const Text('Close All'),
            ),
          ],
        ),
      ],
    );
  },
)''';
