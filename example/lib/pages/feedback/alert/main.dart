import 'package:flutter/material.dart';

import '../../template.dart';
import 'basic.dart';

class AlertPage extends StatefulWidget {
  const AlertPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const [
          AlertBasicUsage(),
        ],
      ),
    );
  }
}
