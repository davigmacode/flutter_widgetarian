import 'dart:math';
import 'package:flutter/material.dart';
import 'types.dart';
import 'data.dart';

class ThemeController extends ChangeNotifier {
  /// Internal Constructor
  ThemeController._({
    required this.available,
    required this.modeIcons,
    this.initialMode = ThemeMode.system,
    this.initialTheme = 'default',
    this.onAvailableChanged,
    this.onThemeChanged,
    this.onModeChanged,
    this.onColorChanged,
    this.onChanged,
  })  : mode = initialMode,
        selected = initialTheme;

  /// Controller which handles updating and controlling current theme.
  ///
  /// [themes] is optional, it determine the map of [ThemeConfig] that will be available to select.
  /// if one of [light] and [dark] is provided,
  /// will create new theme called 'default' and merged to [themes].
  /// [AssertionError] will be thrown if the [themes] is empty.
  ///
  /// [initialTheme] is optional.
  /// If not provided, default theme will be the first provided theme.
  /// Otherwise the given theme will be set as the default theme.
  /// [AssertionError] will be thrown if there is no theme with [initialTheme].
  ///
  /// If the use case is only to switch between light/dark mode,
  /// simply provide [light], [dark], and [initialMode]
  ///
  /// If the use case is multiple theme without dark mode,
  /// simply provide [themes] and [initialTheme]
  ///
  /// If the use case is multiple theme with dark mode,
  /// provide [themes], [initialThemes], and [initialMode]
  factory ThemeController({
    ThemeData? light,
    ThemeData? dark,
    ThemeMap themes = const {},
    ThemeMode initialMode = ThemeMode.system,
    String? initialTheme,
    ThemeModeIcons? modeIcons,
    ThemeChanged? onAvailableChanged,
    ThemeChanged? onThemeChanged,
    ThemeChanged? onModeChanged,
    ThemeChanged? onColorChanged,
    ThemeChanged? onChanged,
  }) {
    final bool hasDefaultTheme = light != null || dark != null;
    final ThemeMap defaultTheme = hasDefaultTheme
        ? {
            'default': ThemeConfig.mode(
              description: 'Default Theme',
              light: light,
              dark: dark,
            )
          }
        : {};
    final ThemeMap availableTheme = defaultTheme..addAll(themes);
    assert(
      availableTheme.isNotEmpty,
      'The available themes should not empty, provide [themes] or [light] or [dark]',
    );
    initialTheme ??= availableTheme.entries.first.key;
    assert(
      availableTheme[initialTheme] != null,
      'The [initialTheme] should include in provided [themes]',
    );
    return ThemeController._(
      initialTheme: initialTheme,
      initialMode: initialMode,
      available: availableTheme,
      modeIcons: modeIcons ?? defaultModeIcons,
      onAvailableChanged: onAvailableChanged,
      onThemeChanged: onThemeChanged,
      onModeChanged: onModeChanged,
      onColorChanged: onColorChanged,
      onChanged: onChanged,
    );
  }

  /// {@template widgetarian.theme.controller.onAvailableChanged}
  /// Called when available themes changed
  /// {@endtemplate}
  ThemeChanged? onAvailableChanged;

  /// {@template widgetarian.theme.controller.onThemeChanged}
  /// Called when selected theme changed
  /// {@endtemplate}
  ThemeChanged? onThemeChanged;

  /// {@template widgetarian.theme.controller.onModeChanged}
  /// Called when theme mode changed
  /// {@endtemplate}
  ThemeChanged? onModeChanged;

  /// {@template widgetarian.theme.controller.onColorChanged}
  /// Called when theme color changed
  /// {@endtemplate}
  ThemeChanged? onColorChanged;

  /// {@template widgetarian.theme.controller.onChanged}
  /// Called when selected theme or theme mode or theme color changed
  /// {@endtemplate}
  ThemeChanged? onChanged;

  /// {@template widgetarian.theme.controller.initialTheme}
  /// Initial provided theme name/key
  /// {@endtemplate}
  String initialTheme;

  /// {@template widgetarian.theme.controller.initialMode}
  /// Initial provided theme mode
  /// {@endtemplate}
  ThemeMode initialMode;

  /// {@template widgetarian.theme.controller.selected}
  /// Current selected theme name/key
  /// {@endtemplate}
  String selected;

  /// {@template widgetarian.theme.controller.selectedIndex}
  /// Return the current selected index
  /// {@endtemplate}
  int get selectedIndex =>
      availableEntries.indexWhere((e) => e.key == selected);

  /// {@template widgetarian.theme.controller.available}
  /// Available themes to select
  /// {@endtemplate}
  ThemeMap available;

  /// {@template widgetarian.theme.controller.availableEntries}
  /// Return the list of available themes
  /// {@endtemplate}
  ThemeList get availableEntries => available.entries.toList();

  /// {@template widgetarian.theme.controller.mode}
  /// Current selected theme mode
  /// {@endtemplate}
  ThemeMode mode;

  /// {@template widgetarian.theme.controller.modeIcons}
  /// Map of the icons represent to the theme mode
  /// {@endtemplate}
  final ThemeModeIcons modeIcons;

  /// {@template widgetarian.theme.controller.defaultModeIcons}
  /// Default map of the icons represent to the theme mode
  /// {@endtemplate}
  static const ThemeModeIcons defaultModeIcons = {
    ThemeMode.system: Icons.brightness_auto_rounded,
    ThemeMode.light: Icons.brightness_low_rounded,
    ThemeMode.dark: Icons.brightness_2_rounded
  };

  /// {@template widgetarian.theme.controller.modeIcon}
  /// Return the icon represent to the current theme mode
  /// {@endtemplate}
  IconData get modeIcon {
    return modeIcons[mode]!;
  }

  /// {@template widgetarian.theme.controller.color}
  /// This value will override the current theme color
  /// {@endtemplate}
  Color? color;

  /// {@template widgetarian.theme.controller.config}
  /// The current theme config
  /// {@endtemplate}
  ThemeConfig get config => available[selected]!.toColor(color);

  /// {@template widgetarian.theme.controller.description}
  /// The current theme description
  /// {@endtemplate}
  String? get description => config.description;

  /// {@template widgetarian.theme.controller.data}
  /// The current main/light theme data
  /// {@endtemplate}
  ThemeData get data => config.data;

  /// {@template widgetarian.theme.controller.lightData}
  /// The current light theme data
  /// {@endtemplate}
  ThemeData get lightData => config.lightData;

  /// {@template widgetarian.theme.controller.darkData}
  /// The current dark theme data
  /// {@endtemplate}
  ThemeData get darkData => config.darkData;

  /// {@template widgetarian.theme.controller.isLightMode}
  /// Whether the theme mode is [ThemeMode.light] or not
  /// {@endtemplate}
  bool get isLightMode => mode == ThemeMode.light;

  /// {@template widgetarian.theme.controller.isDarkMode}
  /// Whether the theme mode is [ThemeMode.dark] or not
  /// {@endtemplate}
  bool get isDarkMode => mode == ThemeMode.dark;

  /// {@template widgetarian.theme.controller.isSystemMode}
  /// Whether the theme mode is [ThemeMode.dark] or not
  /// {@endtemplate}
  bool get isSystemMode => mode == ThemeMode.system;

  /// internal usage
  final _random = Random();

  /// Replace the available themes with new value
  void setThemes(ThemeMap themes) {
    available = themes;
    notifyListeners();
    onAvailableChanged?.call(this);
  }

  /// Update or insert one or multiple theme(s) to the available themes
  void mergeThemes(ThemeMap themes) {
    available.addAll(themes);
    notifyListeners();
    onAvailableChanged?.call(this);
  }

  /// Remove a theme by it's key from the available themes
  void removeTheme(String name) {
    available.remove(name);
    notifyListeners();
    onAvailableChanged?.call(this);
  }

  /// Set the current selected theme
  void select(String name) {
    assert(
      available[name] != null,
      'The [initialTheme] should include in provided [themes]',
    );
    selected = name;
    notifyListeners();
    onThemeChanged?.call(this);
    onChanged?.call(this);
  }

  void selectIndex(int index) {
    final theme = availableEntries[index];
    select(theme.key);
  }

  /// Cycle to next theme in the theme list.
  void selectNext() {
    final nextIndex = (selectedIndex + 1) % availableEntries.length;
    selectIndex(nextIndex);
  }

  /// Cycle to prev theme in the theme list.
  void selectPrev() {
    final prevIndex = (selectedIndex - 1) % availableEntries.length;
    selectIndex(prevIndex);
  }

  /// Select a random theme
  void selectRandom() {
    final maxIndex = availableEntries.length;
    int randomIndex;
    do {
      randomIndex = 0 + _random.nextInt(maxIndex - 0);
    } while (selectedIndex == randomIndex);
    selectIndex(randomIndex);
  }

  /// Override the theme color
  void toColor(Color? color) {
    this.color = color;
    notifyListeners();
    onColorChanged?.call(this);
    onChanged?.call(this);
  }

  /// Set the theme mode
  void toMode(ThemeMode mode) {
    this.mode = mode;
    notifyListeners();
    onModeChanged?.call(this);
    onChanged?.call(this);
  }

  /// Set theme mode to [ThemeMode.light]
  void toLightMode() {
    toMode(ThemeMode.light);
  }

  /// Set theme mode to [ThemeMode.dark]
  void toDarkMode() {
    toMode(ThemeMode.dark);
  }

  /// Set theme mode to [ThemeMode.system]
  void toSystemMode() {
    toMode(ThemeMode.system);
  }

  /// Toggle theme mode between [ThemeMode.light] and [ThemeMode.dark]
  void toggleMode() {
    final nextIndex = (mode.index + 1) % ThemeMode.values.length;
    final nextMode = ThemeMode.values[nextIndex];
    toMode(nextMode);
  }

  /// Reset all values to the initial provided value
  void reset() {
    selected = initialTheme;
    mode = initialMode;
    color = null;
    notifyListeners();
    onThemeChanged?.call(this);
    onModeChanged?.call(this);
    onColorChanged?.call(this);
    onChanged?.call(this);
  }

  /// Reset the selected theme to the initial provided value
  void resetTheme() {
    select(initialTheme);
  }

  /// Reset the theme mode to initial provided value
  void resetMode() {
    toMode(initialMode);
  }

  /// Reset the color scheme to the theme color
  void resetColor() {
    toColor(null);
  }
}
