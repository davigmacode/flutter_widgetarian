import 'package:flutter/material.dart';

import '../../template.dart';
import 'basic.dart';

class SheetPage extends StatefulWidget {
  const SheetPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<SheetPage> createState() => _SheetPageState();
}

class _SheetPageState extends State<SheetPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const [
          SheetBasicUsage(),
        ],
      ),
    );
  }
}
