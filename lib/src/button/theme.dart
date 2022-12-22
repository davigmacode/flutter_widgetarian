import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';
import 'package:widgetarian/utils.dart';
import 'style.dart';

/// Defines the visual properties of [Button].
///
/// Descendant widgets obtain the current [ButtonThemeData] object using
/// `ButtonTheme.of(context)`. Instances of [ButtonThemeData]
/// can be customized with [ButtonThemeData.copyWith] or [ButtonThemeData.merge].
@immutable
class ButtonThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of avatar widget.
  final Curve curve;

  /// The duration over which to animate the parameters of button widget.
  final Duration duration;

  /// The [ButtonStyle] to be applied to the button widget
  final ButtonStyle style;

  /// The [ButtonStyle] that provides fallback values.
  final ButtonStyle fallback;

  /// Creates a theme data that can be used for [ButtonTheme].
  const ButtonThemeData({
    required this.curve,
    required this.duration,
    required this.style,
    required this.fallback,
  });

  /// An [ButtonThemeData] with some reasonable default values.
  static final defaults = ButtonThemeData(
    curve: Curves.linear,
    duration: const Duration(milliseconds: 200),
    style: DrivenButtonStyle.text(),
    fallback: const ButtonStyle(),
  );

  /// Creates a copy of this [ButtonThemeData] but with
  /// the given fields replaced with the new values.
  ButtonThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ButtonStyle? style,
    ButtonStyle? fallback,
  }) {
    return ButtonThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      style: this.style.merge(style),
      fallback: this.fallback.merge(fallback),
    );
  }

  /// Creates a copy of this [ButtonThemeData] but with
  /// the given fields replaced with the new values.
  ButtonThemeData merge(ButtonThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      style: other.style,
      fallback: other.fallback,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'style': style,
        'fallback': fallback,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is ButtonThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant buttons should look like.
class ButtonTheme extends InheritedTheme {
  /// The properties for descendant [Button]s
  final ButtonThemeData data;

  /// Creates a theme that controls
  /// how descendant buttons should look like.
  const ButtonTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [ButtonTheme] that controls the style of
  /// descendant widgets, and merges in the current [ButtonTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ButtonStyle? style,
    ButtonStyle? fallback,
    ButtonThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = ButtonTheme.of(context);
        return ButtonTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                style: style,
                fallback: fallback,
              ),
          child: child,
        );
      },
    );
  }

  /// The [ButtonTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// ButtonThemeData theme = ButtonTheme.of(context);
  /// ```
  static ButtonThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<ButtonTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<ButtonThemeData?>();
    return ButtonThemeData.defaults
        .copyWith(
          fallback: DrivenButtonStyle(
            foregroundColor: appTheme.colorScheme.onSurface,
            backgroundColor: appTheme.unselectedWidgetColor,
            borderColor: appTheme.colorScheme.outline,
            shadowColor: appTheme.colorScheme.shadow,
            selectedStyle: ButtonStyle(
              foregroundColor: appTheme.colorScheme.primary,
              backgroundColor: appTheme.brightness.isLight
                  ? appTheme.colorScheme.primary
                  : appTheme.colorScheme.inversePrimary,
              borderColor: appTheme.colorScheme.primary,
            ),
          ),
        )
        .merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ButtonTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(ButtonTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<ButtonThemeData>('data', data));
  }
}
