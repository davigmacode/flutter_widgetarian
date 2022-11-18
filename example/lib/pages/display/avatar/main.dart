import 'package:flutter/material.dart' hide ButtonStyle;

import '../../template.dart';
import 'basic.dart';
import 'group.dart';

class AvatarPage extends StatefulWidget {
  const AvatarPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: ListView(
        padding: const EdgeInsets.all(25),
        children: const [
          AvatarBasicUsage(),
          AvatarGroupUsage(),
        ],
      ),
    );
  }
}
