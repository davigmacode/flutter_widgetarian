import 'package:flutter/foundation.dart';

class ChoiceController<T> extends ChangeNotifier {
  ChoiceController({
    List<T> value = const [],
    this.items = const [],
    this.onChanged,
    this.multiple = false,
    this.mandatory = false,
  }) : _value = Set.from(value);

  final Set<T> _value;
  final List<T> items;
  final ValueChanged<List<T>>? onChanged;

  /// allow to select multiple values
  final bool multiple;

  /// will always have a value
  final bool mandatory;

  List<T> get value => _value.toList();

  int get length => _value.length;

  bool get isEmpty => _value.isEmpty;

  bool get isNotEmpty => _value.isNotEmpty;

  bool get isIndeterminate => isNotEmpty && !isChecked;

  bool get isChecked => hasEvery(items);

  bool has(T value) => _value.contains(value);

  bool hasAny(List<T> value) => value.any((e) => _value.contains(e));

  bool hasEvery(List<T> value) => value.every((e) => _value.contains(e));

  ValueChanged<bool> selectAll({
    ValueChanged<bool>? onChanged,
  }) {
    return (bool active) {
      if (active) {
        replace(items);
      } else {
        clear();
      }
    };
  }

  ValueChanged<bool> select(
    T item, {
    ValueChanged<bool>? onChanged,
  }) {
    return (bool active) {
      if (has(item) == active) return;
      toggle(item, active);
      onChanged?.call(active);
    };
  }

  /// Mutator to mark a [T] value as either active or inactive.
  void toggle(T item, [bool? active]) {
    active = active ?? !has(item);
    return active
        ? multiple
            ? add(item)
            : replace([item])
        : remove(item);
  }

  /// Mutator to mark a [T] value as active.
  void add(T item) {
    if (_value.add(item)) {
      notifyListeners();
      onChanged?.call(value);
    }
  }

  /// Mutator to mark a [T] value as inactive.
  void remove(T item) {
    if (mandatory && _value.length == 1) return;

    if (_value.remove(item)) {
      notifyListeners();
      onChanged?.call(value);
    }
  }

  void replace(List<T> value) {
    _value
      ..clear()
      ..addAll(value);
    notifyListeners();
    onChanged?.call(value);
  }

  void clear() {
    _value.clear();
    notifyListeners();
    onChanged?.call(value);
  }

  void fill() {
    replace(items);
  }
}
