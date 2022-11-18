import 'package:flutter/widgets.dart';
// import 'dart:ui';

import 'event.dart';
import 'property.dart';

abstract class DrivenWidget extends Widget implements DrivenProperty<Widget> {
  const DrivenWidget({Key? key}) : super(key: key);

  @override
  Widget resolve(Set<WidgetEvent> events);

  static Widget evaluate(Widget value, Set<WidgetEvent> events) {
    return DrivenProperty.evaluate<Widget>(value, events);
  }

  static DrivenWidget by(DrivenPropertyResolver<Widget> callback) {
    return _DrivenWidget(callback);
  }

  static DrivenWidget all(Widget value) {
    return _DrivenWidget((events) => value);
  }
}

class _DrivenWidget extends DrivenWidget {
  _DrivenWidget(this._resolver) : super(key: _resolver({}).key);

  final DrivenPropertyResolver<Widget> _resolver;

  @override
  Widget resolve(Set<WidgetEvent> events) => _resolver(events);

  @override
  Element createElement() {
    throw UnimplementedError();
  }
}

abstract class DrivenColor extends Color implements DrivenProperty<Color> {
  /// Abstract const constructor. This constructor enables subclasses to provide
  /// const constructors so that they can be used in const expressions.
  const DrivenColor(int defaultValue) : super(defaultValue);

  @override
  Color resolve(Set<WidgetEvent> events);

  static Color evaluate(Color value, Set<WidgetEvent> events) {
    return DrivenProperty.evaluate<Color>(value, events);
  }

  static DrivenColor by(DrivenPropertyResolver<Color> callback) {
    return _DrivenColor(callback);
  }

  static DrivenColor all(Color value) {
    return _DrivenColor((events) => value);
  }
}

class _DrivenColor extends DrivenColor {
  _DrivenColor(this._resolver) : super(_resolver({}).value);

  final DrivenPropertyResolver<Color> _resolver;

  @override
  Color resolve(Set<WidgetEvent> events) => _resolver(events);
}

extension ColorDriven on Color {
  static DrivenColor driven(DrivenPropertyResolver<Color> callback) {
    return DrivenColor.by(callback);
  }
}
