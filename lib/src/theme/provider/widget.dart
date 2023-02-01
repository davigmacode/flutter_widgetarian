import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'controller.dart';
import 'types.dart';

class ThemeProvider extends InheritedNotifier<ThemeController>
    with Diagnosticable {
  const ThemeProvider({
    Key? key,
    required ThemeController controller,
    required Widget child,
  }) : super(key: key, notifier: controller, child: child);

  ThemeProvider.builder({
    Key? key,
    required ThemeController controller,
    required ThemeBuilder builder,
  }) : super(
          key: key,
          notifier: controller,
          child: ThemeConsumer(builder: builder),
        );

  static ThemeController of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(result != null, 'No ThemeProvider found in context');
    return result!.notifier!;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ThemeController>('notifier', notifier));
  }
}

class ThemeConsumer extends StatelessWidget {
  const ThemeConsumer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  /// Builder that gets called when the theme changes
  final ThemeBuilder builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ThemeProvider.of(context));
  }
}
