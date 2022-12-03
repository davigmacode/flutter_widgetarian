import 'package:flutter/widgets.dart';
import 'controller.dart';

class Choice<T> extends StatelessWidget {
  const Choice({
    Key? key,
    this.multiple = false,
    this.mandatory = false,
    this.items = const [],
    this.value = const [],
    this.onChanged,
    required this.builder,
    this.child,
  }) : super(key: key);

  final bool multiple;
  final bool mandatory;
  final List<T> items;
  final List<T> value;
  final ValueChanged<List<T>>? onChanged;
  final ChoiceBuilder<T> builder;
  final Widget? child;

  static ChoiceController<T> of<T>(BuildContext context) {
    return ChoiceProvider.of<T>(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceProvider<T>(
      controller: ChoiceController<T>(
        items: items,
        value: value,
        onChanged: onChanged,
        multiple: multiple,
        mandatory: mandatory,
      ),
      child: ChoiceConsumer<T>(
        builder: builder,
        child: child,
      ),
    );
  }
}

//--------------------------------------------------------

class ChoiceProvider<T> extends InheritedNotifier<ChoiceController<T>> {
  const ChoiceProvider({
    Key? key,
    required ChoiceController<T> controller,
    required Widget child,
  }) : super(key: key, notifier: controller, child: child);

  static ChoiceController<T> of<T>(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ChoiceProvider<T>>();
    assert(provider != null, 'No ChoiceProvider found in context');
    return provider!.notifier!;
  }
}

//--------------------------------------------------------

class ChoiceConsumer<T> extends StatelessWidget {
  const ChoiceConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  /// Builder that gets called when the theme changes
  final ChoiceBuilder<T> builder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return builder(context, ChoiceProvider.of<T>(context), child);
  }
}

//--------------------------------------------------------

typedef ChoiceBuilder<T> = Widget Function(
  BuildContext context,
  ChoiceController<T> state,
  Widget? child,
);
