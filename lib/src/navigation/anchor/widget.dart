import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/layout.dart';
import 'style.dart';
import 'theme.dart';

class Anchor extends StatelessWidget {
  const Anchor({
    Key? key,
    this.onTap,
    this.onTapUp,
    this.onTapDown,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onHover,
    this.onFocus,
    this.overlayDisabled = false,
    this.overlayColor,
    this.overlayOpacity,
    this.mouseCursor,
    this.borderRadius,
    this.radius,
    this.shape = BoxShape.rectangle,
    this.padding,
    this.margin,
    this.style,
    this.eventsController,
    this.focusNode,
    this.autofocus = false,
    this.canRequestFocus = true,
    this.disabled = false,
    this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final GestureTapUpCallback? onTapUp;
  final GestureTapDownCallback? onTapDown;
  final VoidCallback? onTapCancel;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocus;
  final MouseCursor? mouseCursor;
  final bool overlayDisabled;
  final Color? overlayColor;
  final double? overlayOpacity;
  final BorderRadius? borderRadius;
  final double? radius;
  final BoxShape shape;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AnchorStyle? style;
  final WidgetEventController? eventsController;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool canRequestFocus;
  final bool disabled;
  final Widget? child;

  AnchorStyle get effectiveStyle {
    return AnchorStyle.from(style).copyWith(
      margin: margin,
      padding: padding,
      shape: shape,
      radius: radius,
      borderRadius: borderRadius,
      overlayColor: overlayColor,
      overlayOpacity: overlayOpacity,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themedStyle = AnchorTheme.of(context).style.merge(effectiveStyle);
    final parentState = _AnchorProvider.of(context);
    return _Anchor(
      parentState: parentState,
      onTap: onTap,
      onTapUp: onTapUp,
      onTapDown: onTapDown,
      onTapCancel: onTapCancel,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocus: onFocus,
      overlayDisabled: overlayDisabled,
      mouseCursor: mouseCursor,
      // overlayColor: overlayColor,
      // overlayOpacity: overlayOpacity,
      // borderRadius: borderRadius,
      // radius: radius,
      // padding: padding,
      // margin: margin,
      // shape: shape,
      eventsController: eventsController,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      disabled: disabled,
      style: themedStyle,
      child: child,
    );
  }
}

class _Anchor extends StatefulWidget {
  const _Anchor({
    Key? key,
    this.parentState,
    this.onTap,
    this.onTapUp,
    this.onTapDown,
    this.onTapCancel,
    this.onDoubleTap,
    this.onLongPress,
    this.onHover,
    this.onFocus,
    this.mouseCursor,
    this.overlayDisabled = false,
    required this.style,
    // this.overlayColor,
    // this.overlayOpacity,
    // this.borderRadius,
    // this.radius,
    // this.padding,
    // this.margin,
    // this.shape = BoxShape.rectangle,
    this.eventsController,
    this.focusNode,
    this.autofocus = false,
    this.canRequestFocus = true,
    this.disabled = false,
    this.child,
  }) : super(key: key);

  final _AnchorState? parentState;
  final VoidCallback? onTap;
  final GestureTapUpCallback? onTapUp;
  final GestureTapDownCallback? onTapDown;
  final VoidCallback? onTapCancel;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocus;
  final bool overlayDisabled;
  final MouseCursor? mouseCursor;
  // final Color? overlayColor;
  // final double? overlayOpacity;
  // final BorderRadius? borderRadius;
  // final double? radius;
  // final EdgeInsetsGeometry? padding;
  // final EdgeInsetsGeometry? margin;
  // final BoxShape shape;
  final AnchorStyle style;
  final WidgetEventController? eventsController;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool canRequestFocus;
  final bool disabled;
  final Widget? child;

  bool get enabled => !disabled;

  bool get overlayEnabled => !overlayDisabled;

  bool get clickable => [
        onTap,
        onTapUp,
        onTapDown,
        onTapCancel,
        onDoubleTap,
        onLongPress
      ].any((e) => e != null);

  MouseCursor get defaultMouseCursor =>
      clickable ? DrivenMouseCursor.clickable : MouseCursor.defer;

  @override
  State<_Anchor> createState() => _AnchorState();
}

class _AnchorState extends State<_Anchor> with WidgetEventMixin<_Anchor> {
  bool childrenActive = false;

  AnchorStyle style = const AnchorStyle();

  @protected
  void setStyle() {
    final raw = widget.style;
    final resolved = AnchorStyle.evaluate(raw, widgetEvents.value);
    style = style.merge(resolved);
  }

  bool get _canRequestFocus {
    final NavigationMode mode = MediaQuery.maybeOf(context)?.navigationMode ??
        NavigationMode.traditional;
    switch (mode) {
      case NavigationMode.traditional:
        return widget.enabled && widget.canRequestFocus;
      case NavigationMode.directional:
        return true;
    }
  }

  void _onTap() {
    if (!childrenActive) {
      widgetEvents.toggle(WidgetEvent.pressed, false);
      widget.onTap?.call();
    }
  }

  void _onTapCancel() {
    if (!childrenActive) {
      widgetEvents.toggle(WidgetEvent.pressed, false);
      widget.onTapCancel?.call();
    }
    widget.parentState?.childrenActive = false;
  }

  void _onTapDown(TapDownDetails details) {
    if (!childrenActive) {
      widgetEvents.toggle(WidgetEvent.pressed, true);
      widget.onTapDown?.call(details);
    }
    widget.parentState?.childrenActive = true;
  }

  void _onTapUp(TapUpDetails details) {
    widget.onTapUp?.call(details);
  }

  void _onHover(bool value) {
    widgetEvents.toggle(WidgetEvent.hovered, value);
    widget.onHover?.call(value);
    widget.parentState?.childrenActive = value;
  }

  void _onFocus(bool value) {
    widgetEvents.toggle(WidgetEvent.focused, value);
    widget.onFocus?.call(value);
  }

  @override
  void initState() {
    initWidgetEvents(widget.eventsController);
    setStyle();
    super.initState();
  }

  @override
  void didUpdateWidget(_Anchor oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      setStyle();
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  void didChangeWidgetEvents() {
    if (mounted) {
      setStyle();
      super.didChangeWidgetEvents();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result = _AnchorProvider(
      state: this,
      child: widget.child ?? const Box(),
    );

    if (style.padding != null) {
      result = Padding(padding: style.padding!, child: result);
    }

    if (widget.enabled && widget.clickable) {
      result = GestureDetector(
        onTap: _onTap,
        onTapUp: _onTapUp,
        onTapDown: _onTapDown,
        onTapCancel: _onTapCancel,
        onDoubleTap: widget.onDoubleTap,
        onLongPress: widget.onLongPress,
        behavior: HitTestBehavior.opaque,
        excludeFromSemantics: true,
        child: result,
      );
    }

    result = Focus(
      onFocusChange: _onFocus,
      canRequestFocus: _canRequestFocus,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      child: MouseRegion(
        opaque: true,
        hitTestBehavior: HitTestBehavior.opaque,
        cursor: widget.mouseCursor ?? widget.defaultMouseCursor,
        onEnter: (event) => _onHover(true),
        onExit: (event) => _onHover(false),
        child: result,
      ),
    );

    if (widget.overlayEnabled) {
      result = AnimatedOverlay(
        shape: style.shape,
        radius: style.radius,
        borderRadius: style.borderRadius,
        color: style.overlayColor,
        opacity: style.overlayOpacity,
        // opacity: widgetEvents.isPressed
        //     ? .1
        //     : widgetEvents.isHovered
        //         ? .05
        //         : 0,
        child: result,
      );
    }

    if (style.margin != null) {
      result = Padding(padding: style.margin!, child: result);
    }

    return result;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    style.debugFillProperties(properties);
  }
}

class _AnchorProvider extends InheritedWidget {
  const _AnchorProvider({
    required this.state,
    required Widget child,
  }) : super(child: child);

  final _AnchorState state;

  @override
  bool updateShouldNotify(_AnchorProvider oldWidget) =>
      state != oldWidget.state;

  static _AnchorState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_AnchorProvider>()?.state;
  }
}
