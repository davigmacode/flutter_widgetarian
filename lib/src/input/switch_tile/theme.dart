import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/theme.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/switch/style.dart';
import 'package:widgetarian/src/button/style.dart';

/// Defines the visual properties of [SwitchTile].
///
/// Descendant widgets obtain the current [SwitchTileThemeData] object using
/// `SwitchTheme.of(context)`. Instances of [SwitchTileThemeData]
/// can be customized with [SwitchTileThemeData.copyWith] or [SwitchTileThemeData.merge].
@immutable
class SwitchTileThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of switch tile widget.
  final Curve curve;

  /// The duration over which to animate the parameters of switch tile widget.
  final Duration duration;

  /// Where to place the control next to a label.
  final ControlAffinity controlAffinity;

  /// The [SwitchStyle] to be applied to the switch tile widget
  final SwitchStyle switchStyle;

  /// The [ButtonStyle] to be applied to the clickable area.
  final ButtonStyle buttonStyle;

  /// Creates a theme data that can be used for [SwitchTileTheme].
  const SwitchTileThemeData({
    required this.curve,
    required this.duration,
    required this.controlAffinity,
    required this.switchStyle,
    required this.buttonStyle,
  });

  /// An [SwitchTileThemeData] with some reasonable default values.
  static final defaults = SwitchTileThemeData(
    curve: Curves.linear,
    duration: const Duration(milliseconds: 200),
    controlAffinity: ControlAffinity.leading,
    switchStyle: const DrivenSwitchStyle(padding: EdgeInsets.zero),
    buttonStyle: DrivenButtonStyle.text(),
  );

  /// Creates a copy of this [SwitchTileThemeData] but with
  /// the given fields replaced with the new values.
  SwitchTileThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    SwitchStyle? switchStyle,
    ButtonStyle? buttonStyle,
  }) {
    return SwitchTileThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      controlAffinity: controlAffinity ?? this.controlAffinity,
      switchStyle: this.switchStyle.merge(switchStyle),
      buttonStyle: this.buttonStyle.merge(buttonStyle),
    );
  }

  /// Creates a copy of this [SwitchTileThemeData] but with
  /// the given fields replaced with the new values.
  SwitchTileThemeData merge(SwitchTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      controlAffinity: other.controlAffinity,
      switchStyle: other.switchStyle,
      buttonStyle: other.buttonStyle,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'controlAffinity': controlAffinity,
        'switchStyle': switchStyle,
        'buttonStyle': buttonStyle,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is SwitchTileThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant switch tile should look like.
class SwitchTileTheme extends InheritedTheme {
  /// The properties for descendant [SwitchTile]s
  final SwitchTileThemeData data;

  /// Creates a theme that controls
  /// how descendant switch should look like.
  const SwitchTileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [SwitchTileTheme] that controls the style of descendant widgets,
  /// and merges in the current [SwitchTileTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    SwitchStyle? switchStyle,
    ButtonStyle? buttonStyle,
    SwitchTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = SwitchTileTheme.of(context);
        return SwitchTileTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                controlAffinity: controlAffinity,
                switchStyle: switchStyle,
                buttonStyle: buttonStyle,
              ),
          child: child,
        );
      },
    );
  }

  /// The [SwitchTileTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// SwitchTileThemeData theme = SwitchTileTheme.of(context);
  /// ```
  static SwitchTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<SwitchTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<SwitchTileThemeData?>();
    return SwitchTileThemeData.defaults.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return SwitchTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(SwitchTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<SwitchTileThemeData>('data', data));
  }
}
