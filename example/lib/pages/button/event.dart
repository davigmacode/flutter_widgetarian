import 'package:flutter/material.dart'
    hide ButtonStyle, TextButton, AnimatedIcon;
import 'package:widgetarian/animation.dart';
import 'package:widgetarian/button.dart';
import 'package:widgetarian/event.dart';
import '../sample.dart';

class ButtonEventUsage extends StatelessWidget {
  const ButtonEventUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Button Interaction',
      script: script,
      children: [
        TonalButton(
          onPressed: () {},
          child: DrivenWidget.by((events) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: ButtonEvent.isPressed(events)
                  ? const Text('Pressed', key: ValueKey('pressed'))
                  : ButtonEvent.isHovered(events)
                      ? const Text('Hovered', key: ValueKey('hovered'))
                      : const Text('Enabled', key: ValueKey('enabled')),
            );
          }),
        ),
        TextButton(
          onPressed: () {},
          child: DrivenWidget.by((events) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: ButtonEvent.isPressed(events)
                  ? const Icon(Icons.check)
                  : AnimatedSpin(
                      enabled: ButtonEvent.isHovered(events),
                      duration: const Duration(seconds: 1),
                      child: const Icon(Icons.settings),
                    ),
            );
          }),
        ),
        Button(
          onPressed: () {},
          style: DrivenButtonStyle.from(
            DrivenButtonStyle.outlined(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            focusedStyle: const ButtonStyle(
              borderColor: Colors.red,
              foregroundColor: Colors.red,
            ),
            hoveredStyle: DrivenButtonStyle.tonal(
              color: Colors.orange,
              foregroundSpacing: 20,
              borderRadius: BorderRadius.circular(25),
            ),
            pressedStyle: DrivenButtonStyle.filled(
              color: Colors.red,
              backgroundOpacity: 1,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          trailing: const Icon(Icons.close),
          child: const Text('Mixed Style'),
        ),
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    TonalButton(
      onPressed: () {},
      child: DrivenWidget.by((events) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: ButtonEvent.isPressed(events)
              ? const Text('Pressed', key: ValueKey('pressed'))
              : ButtonEvent.isHovered(events)
                  ? const Text('Hovered', key: ValueKey('hovered'))
                  : const Text('Enabled', key: ValueKey('enabled')),
        );
      }),
    ),
    TextButton(
      onPressed: () {},
      child: DrivenWidget.by((events) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: ButtonEvent.isPressed(events)
              ? const Icon(Icons.check)
              : AnimatedSpin(
                  enabled: ButtonEvent.isHovered(events),
                  duration: const Duration(seconds: 1),
                  child: const Icon(Icons.settings),
                ),
        );
      }),
    ),
    Button(
      onPressed: () {},
      style: DrivenButtonStyle.from(
        DrivenButtonStyle.outlined(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        focusedStyle: const ButtonStyle(
          backgroundColor: Colors.red,
          foregroundColor: Colors.red,
        ),
        hoveredStyle: DrivenButtonStyle.tonal(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.orange,
          foregroundSpacing: 20,
          borderRadius: BorderRadius.circular(25),
        ),
        pressedStyle: DrivenButtonStyle.filled(
          color: Colors.red,
          backgroundOpacity: 1,
          foregroundColor: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      trailing: const Icon(Icons.close),
      child: const Text('Mixed Style'),
    ),
  ],
)''';
