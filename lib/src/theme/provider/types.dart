import 'package:flutter/widgets.dart';
import 'package:widgetarian/src/theme/material.dart';
import 'controller.dart';

typedef ThemeBuilder = Widget Function(
  BuildContext context,
  ThemeController theme,
);

typedef ThemeExtensionBuilder = ThemeExtensionIterable Function(
  BuildContext context,
);

typedef ThemeChanged = void Function(ThemeController theme);
