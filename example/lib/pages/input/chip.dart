import 'package:flutter/material.dart' hide Chip;
import 'package:widgetarian/display.dart';
import 'dart:developer';
import '../template.dart';

class ChipPage extends StatefulWidget {
  const ChipPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<ChipPage> createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  bool _selected = false;

  void _setSelected(bool value) {
    setState(() => _selected = value);
  }

  @override
  void initState() {
    const style = ChipStyle(margin: EdgeInsets.all(5));
    log('${style.margin}', name: 'style initial');

    final merged = style.merge(ChipStyle.outlined(
      margin: EdgeInsets.zero,
      pressedStyle: const ChipStyle(
        margin: EdgeInsets.all(10),
      ),
    ));
    log('${merged.margin}', name: 'style merged');

    final evaluated = ChipStyle.evaluate(merged, {ChipEvent.pressed});
    log('${evaluated?.margin}', name: 'style pressed');

    // final style = ChipStyle.when(
    //   enabled: ChipStyle.outlined(),
    //   selected: ChipStyle.filled(),
    // );
    // log('${style.backgroundAlpha}', name: 'style');

    // final selected = ChipStyle.evaluate(style, {
    //   ChipEvent.disabled,
    //   ChipEvent.selected,
    // });
    // log('${selected?.backgroundAlpha}', name: 'style selected');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: Center(
        child: Wrap(
          spacing: 25,
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Wrap(
              spacing: 10,
              children: [
                Chip(
                  label: const Text('Toned Chip'),
                  selected: _selected,
                  onPressed: () => {},
                ),
                Chip(
                  label: const Text('Toned Chip'),
                  leading: const Icon(Icons.calendar_month),
                  style: ChipStyle.toned(),
                  selected: _selected,
                  disabled: true,
                  onPressed: () => {},
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              children: [
                Chip(
                  label: const Text('Outlined Chip'),
                  style: ChipStyle.outlined(),
                  checkmark: true,
                  selected: _selected,
                  onDeleted: () {},
                ),
                Chip(
                  label: const Text('Outlined Chip'),
                  trailing: const Icon(Icons.calendar_month),
                  style: ChipStyle.outlined(),
                  checkmark: true,
                  disabled: true,
                  selected: _selected,
                  onSelected: _setSelected,
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              children: [
                Chip(
                  label: const Text('Filled Chip'),
                  avatarText: const Text('FC'),
                  style: ChipStyle.filled(
                    selectedStyle: ChipStyle(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  selected: _selected,
                  onSelected: _setSelected,
                  onDeleted: () {},
                ),
                Chip(
                  label: const Text('Filled Chip'),
                  leading: const Icon(Icons.image),
                  style: ChipStyle.filled(),
                  selected: _selected,
                  onDeleted: () {},
                  disabled: true,
                ),
              ],
            ),
            Wrap(
              spacing: 10,
              children: [
                Chip(
                  label: const Text('Mixed Style Chip'),
                  avatarImage: const NetworkImage('https://i.pravatar.cc/50'),
                  style: ChipStyle.when(
                    enabled: ChipStyle.toned(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    selected: ChipStyle.filled(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  selected: _selected,
                  onSelected: _setSelected,
                  checkmark: true,
                  onDeleted: () {},
                ),
                Chip(
                  label: const Text('Mixed Style Chip'),
                  leading: const Icon(Icons.image),
                  style: ChipStyle.filled(
                    selectedStyle: ChipStyle.outlined(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  selected: _selected,
                  onDeleted: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
