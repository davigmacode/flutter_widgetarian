import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';
import 'style.dart';

/// Defines the visual properties of [Avatar].
///
/// Descendant widgets obtain the current [AvatarThemeData] object using
/// `AvatarTheme.of(context)`. Instances of [AvatarThemeData]
/// can be customized with [AvatarThemeData.copyWith] or [AvatarThemeData.merge].
@immutable
class AvatarThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of avatar widget.
  final Curve curve;

  /// The duration over which to animate the parameters of avatar widget.
  final Duration duration;

  /// The [AvatarStyle] to be applied to the avatar widget
  final AvatarStyle style;

  /// Creates a theme data that can be used for [AvatarTheme].
  const AvatarThemeData({
    required this.curve,
    required this.duration,
    required this.style,
  });

  /// An [AvatarThemeData] with some reasonable default values.
  static const defaults = AvatarThemeData(
    curve: Curves.linear,
    duration: Duration(milliseconds: 200),
    style: AvatarStyle.defaults,
  );

  /// Creates a copy of this [AvatarThemeData] but with
  /// the given fields replaced with the new values.
  AvatarThemeData copyWith({
    Curve? curve,
    Duration? duration,
    AvatarStyle? style,
  }) {
    return AvatarThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
    );
  }

  /// Creates a copy of this [AvatarThemeData] but with
  /// the given fields replaced with the new values.
  AvatarThemeData merge(AvatarThemeData? other) {
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
    return other is AvatarThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant avatar should look like.
class AvatarTheme extends InheritedTheme {
  /// The properties for descendant [Avatar]s
  final AvatarThemeData data;

  /// Creates a theme that controls
  /// how descendant [AvatarTheme]s should look like.
  const AvatarTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [AvatarTheme] that controls the style of
  /// descendant widgets, and merges in the current [AvatarTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    AvatarStyle? style,
    AvatarThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = AvatarTheme.of(context);
        return AvatarTheme(
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

  /// The [AvatarTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// AvatarTheme theme = AvatarTheme.of(context);
  /// ```
  static AvatarThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<AvatarTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<AvatarThemeData?>();
    return AvatarThemeData.defaults.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return AvatarTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(AvatarTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AvatarThemeData>('data', data));
  }
}
