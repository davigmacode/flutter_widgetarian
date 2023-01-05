enum SwitchVariant {
  m2,
  m3,
  ios;

  /// Whether or not this is m2 variant
  bool get isM2 => this == SwitchVariant.m2;

  /// Whether or not this is m3 variant
  bool get isM3 => this == SwitchVariant.m3;

  /// Whether or not this is ios variant
  bool get isIos => this == SwitchVariant.ios;
}
