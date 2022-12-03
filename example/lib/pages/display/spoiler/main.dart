import 'package:flutter/material.dart';

import '../../template.dart';
import 'basic.dart';

class SpoilerPage extends StatefulWidget {
  const SpoilerPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<SpoilerPage> createState() => _SpoilerPageState();
}

class _SpoilerPageState extends State<SpoilerPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const [
          SpoilerBasicUsage(),
        ],
      ),
    );
  }
}
