import 'package:flutter/material.dart' hide Checkbox;
import '../../template.dart';
import 'basic.dart';
import 'group.dart';
import 'indeterminate.dart';
import 'list.dart';

class CheckboxPage extends StatelessWidget {
  const CheckboxPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const <Widget>[
          CheckboxBasicUsage(),
          CheckboxGroupUsage(),
          CheckboxIndeterminateUsage(),
          CheckboxListUsage(),
        ],
      ),
    );
  }
}
