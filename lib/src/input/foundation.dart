/// Where to place the control next to a label.
enum ControlAffinity {
  /// Position the control on the leading edge, and the secondary widget, if
  /// any, on the trailing edge.
  leading,

  /// Position the control on the trailing edge, and the secondary widget, if
  /// any, on the leading edge.
  trailing,

  /// Position the control relative to the text in the fashion that is typical
  /// for the current platform, and place the secondary widget on the opposite
  /// side.
  platform;

  /// Whether or not this is leading
  bool get isLeading => this == ControlAffinity.leading;

  /// Whether or not this is trailing
  bool get isTrailing => this == ControlAffinity.trailing;

  /// Whether or not this is platform
  bool get isPlatform => this == ControlAffinity.platform;
}
