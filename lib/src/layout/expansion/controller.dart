import 'package:flutter/widgets.dart';

typedef ExpansionBuilder = Widget Function(
  BuildContext context,
  ExpansionController state,
  Widget? child,
);

//--------------------------------------------------------

class ExpansionController extends ChangeNotifier {
  ExpansionController({
    required bool expanded,
    ValueChanged<bool>? onChanged,
  })  : _expanded = expanded,
        _onChanged = onChanged;

  bool _expanded;
  final ValueChanged<bool>? _onChanged;

  bool get expanded => _expanded;
  bool get collapsed => !expanded;

  void assign(bool expanded) {
    if (_expanded != expanded) {
      _expanded = expanded;
      notifyListeners();
      _onChanged?.call(_expanded);
    }
  }

  void toggle([bool? expanded]) {
    if (expanded == null) {
      assign(!_expanded);
      return;
    }
    assign(expanded);
  }

  void expand() {
    toggle(true);
  }

  void collapse() {
    toggle(false);
  }
}

//--------------------------------------------------------

class ExpansionProvider extends InheritedNotifier<ExpansionController> {
  const ExpansionProvider({
    Key? key,
    required ExpansionController controller,
    required Widget child,
  }) : super(key: key, notifier: controller, child: child);

  static ExpansionController of(BuildContext context) {
    final ExpansionProvider? result =
        context.dependOnInheritedWidgetOfExactType<ExpansionProvider>();
    assert(result != null, 'No Expansion found in context');
    return result!.notifier!;
  }
}

//--------------------------------------------------------

class ExpansionConsumer extends StatelessWidget {
  const ExpansionConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  /// Builder that gets called when the expansion changes
  final ExpansionBuilder builder;

  @override
  Widget build(BuildContext context) {
    return builder(context, ExpansionProvider.of(context), child);
  }
}
