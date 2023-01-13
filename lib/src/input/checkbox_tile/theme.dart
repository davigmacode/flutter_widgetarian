import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'package:widgetarian/src/input/foundation.dart';
import 'package:widgetarian/src/input/checkbox/style.dart';
import 'package:widgetarian/src/button/style.dart';

/// Defines the visual properties of [CheckboxTile].
///
/// Descendant widgets obtain the current [CheckboxTileThemeData] object using
/// `CheckboxTheme.of(context)`. Instances of [CheckboxTileThemeData]
/// can be customized with [CheckboxTileThemeData.copyWith] or [CheckboxTileThemeData.merge].
@immutable
class CheckboxTileThemeData with Diagnosticable {
  /// The curve to apply when animating the parameters of checkbox tile widget.
  final Curve curve;

  /// The duration over which to animate the parameters of checkbox tile widget.
  final Duration duration;

  /// Where to place the control next to a label.
  final ControlAffinity controlAffinity;

  /// The [CheckboxStyle] to be applied to the checkbox tile widget
  final CheckboxStyle checkboxStyle;

  /// The [ButtonStyle] to be applied to the clickable area.
  final ButtonStyle buttonStyle;

  /// Creates a theme data that can be used for [CheckboxTileTheme].
  const CheckboxTileThemeData({
    required this.curve,
    required this.duration,
    required this.controlAffinity,
    required this.checkboxStyle,
    required this.buttonStyle,
  });

  /// An [CheckboxTileThemeData] with some reasonable default values.
  static final defaults = CheckboxTileThemeData(
    curve: Curves.linear,
    duration: const Duration(milliseconds: 200),
    controlAffinity: ControlAffinity.leading,
    checkboxStyle: const DrivenCheckboxStyle(padding: EdgeInsets.zero),
    buttonStyle: DrivenButtonStyle.text(),
  );

  /// Creates a copy of this [CheckboxTileThemeData] but with
  /// the given fields replaced with the new values.
  CheckboxTileThemeData copyWith({
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    CheckboxStyle? checkboxStyle,
    ButtonStyle? buttonStyle,
  }) {
    return CheckboxTileThemeData(
      curve: curve ?? this.curve,
      duration: duration ?? this.duration,
      controlAffinity: controlAffinity ?? this.controlAffinity,
      checkboxStyle: this.checkboxStyle.merge(checkboxStyle),
      buttonStyle: this.buttonStyle.merge(buttonStyle),
    );
  }

  /// Creates a copy of this [CheckboxTileThemeData] but with
  /// the given fields replaced with the new values.
  CheckboxTileThemeData merge(CheckboxTileThemeData? other) {
    // if null return current object
    if (other == null) return this;

    return copyWith(
      curve: other.curve,
      duration: other.duration,
      controlAffinity: other.controlAffinity,
      checkboxStyle: other.checkboxStyle,
      buttonStyle: other.buttonStyle,
    );
  }

  Map<String, dynamic> toMap() => {
        'curve': curve,
        'duration': duration,
        'controlAffinity': controlAffinity,
        'checkboxStyle': checkboxStyle,
        'buttonStyle': buttonStyle,
      };

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is CheckboxTileThemeData && mapEquals(other.toMap(), toMap());
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

/// A Widget that controls how descendant checkbox tile should look like.
class CheckboxTileTheme extends InheritedTheme {
  /// The properties for descendant [CheckboxTile]s
  final CheckboxTileThemeData data;

  /// Creates a theme that controls
  /// how descendant checkbox should look like.
  const CheckboxTileTheme({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  /// Creates an [CheckboxTileTheme] that controls the style of descendant widgets,
  /// and merges in the current [CheckboxTileTheme], if any.
  ///
  /// The [child] arguments must not be null.
  static Widget merge({
    Key? key,
    Curve? curve,
    Duration? duration,
    ControlAffinity? controlAffinity,
    CheckboxStyle? checkboxStyle,
    ButtonStyle? buttonStyle,
    CheckboxTileThemeData? data,
    required Widget child,
  }) {
    return Builder(
      builder: (BuildContext context) {
        final parent = CheckboxTileTheme.of(context);
        return CheckboxTileTheme(
          key: key,
          data: parent.merge(data).copyWith(
                curve: curve,
                duration: duration,
                controlAffinity: controlAffinity,
                checkboxStyle: checkboxStyle,
                buttonStyle: buttonStyle,
              ),
          child: child,
        );
      },
    );
  }

  /// The [CheckboxTileTheme] from the closest instance of
  /// this class that encloses the given context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// CheckboxTileThemeData theme = CheckboxTileTheme.of(context);
  /// ```
  static CheckboxTileThemeData of(BuildContext context) {
    final parentTheme =
        context.dependOnInheritedWidgetOfExactType<CheckboxTileTheme>();
    if (parentTheme != null) return parentTheme.data;

    final appTheme = Theme.of(context);
    final globalTheme = appTheme.extension<CheckboxTileThemeData?>();
    return CheckboxTileThemeData.defaults.merge(globalTheme);
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return CheckboxTileTheme(data: data, child: child);
  }

  @override
  bool updateShouldNotify(CheckboxTileTheme oldWidget) {
    return oldWidget.data != data;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<CheckboxTileThemeData>('data', data));
  }
}
