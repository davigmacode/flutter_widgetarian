import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/radio/style.dart';
import 'package:widgetarian/src/button/style.dart';

/// Defines the visual properties of [RadioTile].
///
/// Descendant widgets obtain the current [RadioTileThemeData] object using
/// `RadioTheme.of(context)`. Instances of [RadioTileThemeData]
/// can be customized with [RadioTileThemeData.copyWith] or [RadioTileThemeData.merge].
@immutable
class RadioTileThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of radio tile widget.
  final Curve curve;

  /// The duration over which to animate the parameters of radio tile widget.
  final Duration duration;

  /// Where to place the control next to a label.
  final ControlAffinity controlAffinity;

  /// The [RadioStyle] to be applied to the radio tile widget
  final RadioStyle radioStyle;

  /// The [ButtonStyle] to be applied to the clickable area.
  final ButtonStyle buttonStyle;

  /// Creates a theme data that can be used for [RadioTileTheme].
  const RadioTileThemeData({
    required this.curve,
    required this.duration,
    required this.controlAffinity,
    required this.radioStyle,
    required this.buttonStyle,
  });

  /// An [RadioTileThemeData] with some reasonable default values.
  static final defaults = RadioTileThemeData(
    curve: Curves.linear,
    duration: const Duration(milliseconds: 200),
    controlAffinity: ControlAffinity.leading,
    radioStyle: const DrivenRadioStyle(padding: EdgeInsets.zero),
    buttonStyle: DrivenButtonStyle.text(),
  );

  /// Creates a copy of this [RadioTileThemeData] but with
  /// the given fields replaced with the new values.
  RadioTileThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    RadioStyle? radioStyle,
    ButtonStyle? buttonStyle,
  }) {
    return RadioTileThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      controlAffinity: controlAffinity ?? this.controlAffinity,
      radioStyle: this.radioStyle.merge(radioStyle),
      buttonStyle: this.buttonStyle.merge(buttonStyle),
    );
  }

  /// Creates a copy of this [RadioTileThemeData] but with
  /// the given fields replaced with the new values.
  RadioTileThemeData merge(RadioTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      controlAffinity: other.controlAffinity,
      radioStyle: other.radioStyle,
      buttonStyle: other.buttonStyle,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'controlAffinity': controlAffinity,
        'radioStyle': radioStyle,
        'buttonStyle': buttonStyle,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is RadioTileThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant radio tile should look like.
class RadioTileTheme extends InheritedTheme {
  /// The properties for descendant [RadioTile]s
  final RadioTileThemeData data;

  /// Creates a theme that controls
  /// how descendant radio should look like.
  const RadioTileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [RadioTileTheme] that controls the style of descendant widgets,
  /// and merges in the current [RadioTileTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    RadioStyle? radioStyle,
    ButtonStyle? buttonStyle,
    RadioTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = RadioTileTheme.of(context);
        return RadioTileTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                controlAffinity: controlAffinity,
                radioStyle: radioStyle,
                buttonStyle: buttonStyle,
              ),
          child: child,
        );
      },
    );
  }

  /// The [RadioTileTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// RadioTileThemeData theme = RadioTileTheme.of(context);
  /// ```
  static RadioTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<RadioTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<RadioTileThemeData?>();
    return RadioTileThemeData.defaults.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return RadioTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(RadioTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<RadioTileThemeData>('data', data));
  }
}
