import 'package:flutter/material.dart' hide Switch, ButtonStyle;
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/feedback.dart';
import 'package:widgetarian/choice.dart';
import 'package:widgetarian/input.dart';

import '../../sample.dart';

class AlertBasicUsage extends StatefulWidget {
  const AlertBasicUsage({Key? key}) : super(key: key);

  @override
  State<AlertBasicUsage> createState() => _AlertBasicUsageState();
}

class _AlertBasicUsageState extends State<AlertBasicUsage> {
  List<String> choices = ['Tonal', 'Elevated', 'Outlined'];
  List<String> selected = [];

  void setSelected(List<String> value) {
    setState(() => selected = value);
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Basic Usage',
      script: script,
      wrapped: false,
      options: Choice<String>(
        mandatory: true,
        value: selected,
        onChanged: setSelected,
        builder: (context, group, _) {
          return ListView(
            shrinkWrap: true,
            children: List<Widget>.generate(
              choices.length,
              (i) => SwitchTile.list(
                loosen: false,
                controlAffinity: ControlAffinity.trailing,
                selected: group.has(choices[i]),
                onChanged: group.select(choices[i]),
                child: Text(choices[i]),
              ),
            ),
          );
        },
      ),
      children: const [
        Alert(
          style: AlertStyle.tonal(
            foregroundColor: Colors.red,
            backgroundColor: Colors.red,
            padding: EdgeInsets.all(20),
          ),
          icon: Icon(Icons.error),
          action: Icon(Icons.close),
          // title:  Text('Warning'),
          message: Text('This is a warning alert — check it out!'),
        ),
        Gap(20),
        Alert(
          style: AlertStyle.tonal(
            foregroundColor: Colors.orange,
            backgroundColor: Colors.orange,
            padding: EdgeInsets.all(20),
          ),
          icon: Icon(Icons.warning),
          action: Icon(Icons.close),
          // title:  Text('Warning'),
          message: Text('This is a warning alert — check it out!'),
        ),
        Gap(20),
        Alert(
          style: AlertStyle.tonal(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.blue,
            padding: EdgeInsets.all(20),
          ),
          icon: Icon(Icons.info),
          action: Icon(Icons.close),
          // title:  Text('Warning'),
          message: Text('This is a warning alert — check it out!'),
        ),
        Gap(20),
        Alert(
          style: AlertStyle.tonal(
            foregroundColor: Colors.green,
            backgroundColor: Colors.green,
            padding: EdgeInsets.all(20),
          ),
          icon: Icon(Icons.check_circle),
          action: Icon(Icons.close),
          // title:  Text('Warning'),
          message: Text('This is a warning alert — check it out!'),
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
