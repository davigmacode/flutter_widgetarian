import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';
import 'style.dart';

/// Defines the visual properties of [Anchor].
///
/// Descendant widgets obtain the current [AnchorThemeData] object using
/// `AnchorTheme.of(context)`. Instances of [AnchorThemeData]
/// can be customized with [SheetThemeData.copyWith] or [AnchorThemeData.merge].
@immutable
class AnchorThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of anchor widget.
  final Curve curve;

  /// The duration over which to animate the parameters of anchor widget.
  final Duration duration;

  /// The [AnchorStyle] to be applied to the anchor widget
  final AnchorStyle style;

  /// Creates a theme data that can be used for [AnchorTheme].
  const AnchorThemeData({
    required this.curve,
    required this.duration,
    required this.style,
  });

  /// An [AnchorThemeData] with some reasonable default values.
  static const defaults = AnchorThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: AnchorStyle.defaults,
  );

  /// Creates a copy of this [AnchorThemeData] but with
  /// the given fields replaced with the new values.
  AnchorThemeData copyWith({
    Curve? curve,
    Duration? duration,
    AnchorStyle? style,
  }) {
    return AnchorThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [AnchorThemeData] but with
  /// the given fields replaced with the new values.
  AnchorThemeData merge(AnchorThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'style': style,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is AnchorThemeData && mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => Object.hashAll(toMap().values);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    toMap().entries.forEach((el) {
      properties.add(DiagnosticsProperty(el.key, el.value, defaultValue: null));
    });
  }
}

/// A Widget that controls how descendant [Anchor]s should look like.
class AnchorTheme extends InheritedTheme {
  /// The properties for descendant [Anchor]s
  final AnchorThemeData data;

  /// Creates a theme that controls
  /// how descendant [Anchor]s should look like.
  const AnchorTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [AnchorTheme] that controls the style of
  /// descendant widgets, and merges in the current [AnchorTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    AnchorStyle? style,
    AnchorThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = AnchorTheme.of(context);
        return AnchorTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                style: style,
              ),
          child: child,
        );
      },
    );
  }

  /// The [AnchorTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// AnchorThemeData theme = AnchorTheme.of(context);
  /// ```
  static AnchorThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<AnchorTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<AnchorThemeData?>();
    return AnchorThemeData.defaults.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AnchorTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AnchorTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AnchorThemeData>('data', data));
  }
}
