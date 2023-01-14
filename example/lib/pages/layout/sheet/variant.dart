import 'package:flutter/material.dart' hide Overlay;
import 'package:widgetarian/layout.dart';

import '../../sample.dart';

class SheetVariantUsage extends StatelessWidget {
  const SheetVariantUsage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Sheet Variant',
      script: script,
      wrapped: false,
      children: [
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: const [
            TonalSheet.square(
              size: 100,
              severity: SheetSeverity.danger,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Tonal'),
                  subtitle: Text('Danger'),
                ),
              ),
            ),
            TonalSheet.square(
              size: 100,
              severity: SheetSeverity.warning,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Tonal'),
                  subtitle: Text('Warning'),
                ),
              ),
            ),
            TonalSheet.square(
              size: 100,
              severity: SheetSeverity.success,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Tonal'),
                  subtitle: Text('Success'),
                ),
              ),
            ),
            TonalSheet.square(
              size: 100,
              severity: SheetSeverity.info,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Tonal'),
                  subtitle: Text('Info'),
                ),
              ),
            ),
          ],
        ),
        const Gap(20),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: const [
            ElevatedSheet.square(
              size: 100,
              severity: SheetSeverity.danger,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Elevated'),
                  subtitle: Text('Danger'),
                ),
              ),
            ),
            ElevatedSheet.square(
              size: 100,
              severity: SheetSeverity.warning,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Elevated'),
                  subtitle: Text('Warning'),
                ),
              ),
            ),
            ElevatedSheet.square(
              size: 100,
              severity: SheetSeverity.success,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Elevated'),
                  subtitle: Text('Success'),
                ),
              ),
            ),
            ElevatedSheet.square(
              size: 100,
              severity: SheetSeverity.info,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Elevated'),
                  subtitle: Text('Info'),
                ),
              ),
            ),
          ],
        ),
        const Gap(20),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: const [
            FilledSheet.square(
              size: 100,
              severity: SheetSeverity.danger,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Filled'),
                  subtitle: Text('Danger'),
                ),
              ),
            ),
            FilledSheet.square(
              size: 100,
              severity: SheetSeverity.warning,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Filled'),
                  subtitle: Text('Warning'),
                ),
              ),
            ),
            FilledSheet.square(
              size: 100,
              severity: SheetSeverity.success,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Filled'),
                  subtitle: Text('Success'),
                ),
              ),
            ),
            FilledSheet.square(
              size: 100,
              severity: SheetSeverity.info,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Filled'),
                  subtitle: Text('Info'),
                ),
              ),
            ),
          ],
        ),
        const Gap(20),
        Wrap(
          spacing: 15,
          runSpacing: 15,
          children: const [
            OutlinedSheet.square(
              size: 100,
              severity: SheetSeverity.danger,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Outlined'),
                  subtitle: Text('Danger'),
                ),
              ),
            ),
            OutlinedSheet.square(
              size: 100,
              severity: SheetSeverity.warning,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Outlined'),
                  subtitle: Text('Warning'),
                ),
              ),
            ),
            OutlinedSheet.square(
              size: 100,
              severity: SheetSeverity.success,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Outlined'),
                  subtitle: Text('Success'),
                ),
              ),
            ),
            OutlinedSheet.square(
              size: 100,
              severity: SheetSeverity.info,
              child: Center(
                child: TextTile(
                  align: TextTileAlign.center,
                  title: Text('Outlined'),
                  subtitle: Text('Info'),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

const script = '''Wrap(
  spacing: 15,
  runSpacing: 15,
  children: [
    TonalSheet.circle(
      radius: 50,
      child: Center(child: Text('Tonal')),
    ),
    ElevatedSheet.circle(
      radius: 50,
      child: Center(child: Text('Elevated')),
    ),
    FilledSheet.circle(
      radius: 50,
      child: Center(child: Text('Filled')),
    ),
    OutlinedSheet.circle(
      radius: 50,
      child: Center(child: Text('Outlined')),
    ),
  ],
)''';
