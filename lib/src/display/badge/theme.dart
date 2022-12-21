import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';
import 'style.dart';

/// Defines the visual properties of [Badge].
///
/// Descendant widgets obtain the current [BadgeThemeData] object using
/// `BadgeTheme.of(context)`. Instances of [BadgeThemeData]
/// can be customized with [BadgeThemeData.copyWith] or [BadgeThemeData.merge].
@immutable
class BadgeThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of badge widget.
  final Curve curve;

  /// The duration over which to animate the parameters of badge widget.
  final Duration duration;

  /// Align the badge content within the child.
  final AlignmentGeometry alignment;

  /// Offset of the badge content
  final Offset offset;

  /// The [BadgeStyle] to be applied to the badge widget
  final BadgeStyle style;

  /// Creates a theme data that can be used for [BadgeTheme].
  const BadgeThemeData({
    required this.curve,
    required this.duration,
    required this.alignment,
    required this.offset,
    required this.style,
  });

  /// An [BadgeThemeData] with some reasonable default values.
  static const defaults = BadgeThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    alignment: Alignment.topRight,
    offset: Offset.zero,
    style: BadgeStyle.defaults,
  );

  /// Creates a copy of this [BadgeThemeData] but with
  /// the given fields replaced with the new values.
  BadgeThemeData copyWith({
    Curve? curve,
    Duration? duration,
    AlignmentGeometry? alignment,
    Offset? offset,
    BadgeStyle? style,
  }) {
    return BadgeThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      alignment: alignment ?? this.alignment,
      offset: offset ?? this.offset,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [BadgeThemeData] but with
  /// the given fields replaced with the new values.
  BadgeThemeData merge(BadgeThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      alignment: other.alignment,
      offset: other.offset,
      style: other.style,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'alignment': alignment,
        'offset': offset,
        'style': style,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is BadgeThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant badges should look like.
class BadgeTheme extends InheritedTheme {
  /// The properties for descendant [Badge]s
  final BadgeThemeData data;

  /// Creates a theme that controls
  /// how descendant [BadgeTheme]s should look like.
  const BadgeTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [BadgeTheme] that controls the style of
  /// descendant widgets, and merges in the current [BadgeTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    AlignmentGeometry? alignment,
    Offset? offset,
    BadgeStyle? style,
    BadgeThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = BadgeTheme.of(context);
        return BadgeTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                alignment: alignment,
                offset: offset,
                style: style,
              ),
          child: child,
        );
      },
    );
  }

  /// The [BadgeTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// BadgeThemeData theme = BadgeTheme.of(context);
  /// ```
  static BadgeThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<BadgeTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<BadgeThemeData?>();
    return BadgeThemeData.defaults.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return BadgeTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(BadgeTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<BadgeThemeData>('data', data));
  }
}
