enum SheetVariant {
  text,
  tonal,
  elevated,
  filled,
  outlined;

  /// Whether or not this is text variant
  bool get isText => this == SheetVariant.text;

  /// Whether or not this is tonal variant
  bool get isTonal => this == SheetVariant.tonal;

  /// Whether or not this is elevated variant
  bool get isElevated => this == SheetVariant.elevated;

  /// Whether or not this is filled variant
  bool get isFilled => this == SheetVariant.filled;

  /// Whether or not this is outlined variant
  bool get isOutlined => this == SheetVariant.outlined;
}

enum SheetSeverity {
  danger,
  warning,
  success,
  info;

  /// Whether or not this is danger severity
  bool get isDanger => this == SheetSeverity.danger;

  /// Whether or not this is warning severity
  bool get isWarning => this == SheetSeverity.warning;

  /// Whether or not this is success severity
  bool get isSuccess => this == SheetSeverity.success;

  /// Whether or not this is info severity
  bool get isInfo => this == SheetSeverity.info;
}
