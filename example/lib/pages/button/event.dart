import 'package:flutter/material.dart' hide ButtonStyle, AnimatedIcon;
import 'package:widgetarian/animation.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/event.dart';
import '../sample.dart';

class ButtonEventUsage extends StatelessWidget {
  const ButtonEventUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Button Event',
      script: '',
      children: [
        Button(
          onPressed: () => {},
          style: ButtonStyle.flat(),
          child: DrivenWidget.by((events) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: ButtonEvent.isPressed(events)
                  ? const Icon(Icons.check)
                  : AnimatedSpin(
                      clockwise: false,
                      enabled: ButtonEvent.isHovered(events),
                      duration: const Duration(seconds: 1),
                      child: const Icon(Icons.settings),
                    ),
            );
            // return AnimatedIcon(
            //   icon: ButtonEvent.isPressed(events)
            //       ? Icons.check
            //       : Icons.settings,
            //   // icon: Icons.expand_more,
            //   // scale: ButtonEvent.isHovered(events) ? 2 : 1,
            //   // rotation: ButtonEvent.isHovered(events) ? 180 : 0,
            //   // flipX: ButtonEvent.isPressed(events),
            //   // flipY: ButtonEvent.isPressed(events),
            // );
          }),
        ),
        Button(
          onPressed: () => {},
          style: ButtonStyle.toned(),
          child: DrivenWidget.by((events) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: ButtonEvent.isHovered(events)
                  ? const Text('Hovered', key: ValueKey('hovered'))
                  : const Text(
                      'Flat Button',
                      key: ValueKey('enabled'),
                    ),
            );
          }),
        ),
        Button(
          onPressed: () {},
          style: ButtonStyle.when(
            enabled: ButtonStyle.toned(
              borderRadius: BorderRadius.circular(25),
            ),
            focused: const ButtonStyle(
              backgroundColor: Colors.red,
              foregroundColor: Colors.red,
            ),
            hovered: ButtonStyle.outlined(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            pressed: ButtonStyle.filled(
              color: Colors.red,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: const Text('Mixed Style Chip'),
        ),
      ],
    );
  }
}
