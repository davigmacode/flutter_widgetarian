import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:widgetarian/event.dart';
import 'package:widgetarian/layout.dart';

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
    this.overlayColor,
    this.overlayOpacity,
    this.mouseCursor,
    this.radius,
    this.padding,
    this.margin,
    this.eventsController,
    this.focusNode,
    this.autofocus = false,
    this.canRequestFocus = true,
    this.disabled = false,
    this.shape = BoxShape.rectangle,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onTap;
  final GestureTapUpCallback? onTapUp;
  final GestureTapDownCallback? onTapDown;
  final VoidCallback? onTapCancel;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocus;
  final Color? overlayColor;
  final double? overlayOpacity;
  final MouseCursor? mouseCursor;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final WidgetEventController? eventsController;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool canRequestFocus;
  final BoxShape shape;
  final bool disabled;
  final Widget child;

  @override
  Widget build(BuildContext context) {
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
      overlayColor: overlayColor,
      overlayOpacity: overlayOpacity,
      mouseCursor: mouseCursor,
      radius: radius,
      padding: padding,
      margin: margin,
      eventsController: eventsController,
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: canRequestFocus,
      disabled: disabled,
      shape: shape,
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
    this.overlayColor,
    this.overlayOpacity,
    this.mouseCursor,
    this.radius,
    this.padding,
    this.margin,
    this.eventsController,
    this.focusNode,
    this.autofocus = false,
    this.canRequestFocus = true,
    this.disabled = false,
    this.shape = BoxShape.rectangle,
    required this.child,
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
  final Color? overlayColor;
  final double? overlayOpacity;
  final MouseCursor? mouseCursor;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final WidgetEventController? eventsController;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool canRequestFocus;
  final BoxShape shape;
  final bool disabled;
  final Widget child;

  bool get enabled => !disabled;

  bool get clickable =>
      onTap != null ||
      onTapUp != null ||
      onTapDown != null ||
      onTapCancel != null ||
      onDoubleTap != null ||
      onLongPress != null;

  MouseCursor get defaultMouseCursor =>
      clickable ? DrivenMouseCursor.clickable : MouseCursor.defer;

  @override
  State<_Anchor> createState() => _AnchorState();
}

class _AnchorState extends State<_Anchor> with WidgetEventMixin<_Anchor> {
  bool childrenActive = false;

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
    super.initState();
  }

  @override
  void didUpdateWidget(_Anchor oldWidget) {
    if (mounted) {
      updateWidgetEvents(oldWidget.eventsController, widget.eventsController);
      super.didUpdateWidget(oldWidget);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget result = widget.child;

    if (widget.padding != null) {
      result = Padding(padding: widget.padding!, child: result);
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

    result = _AnchorProvider(
      state: this,
      child: AnimatedOverlay(
        shape: widget.shape,
        radius: widget.radius,
        color: widget.overlayColor,
        opacity: widgetEvents.isPressed
            ? .1
            : widgetEvents.isHovered
                ? .05
                : 0,
        child: Focus(
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
        ),
      ),
    );

    if (widget.margin != null) {
      result = Padding(padding: widget.margin!, child: result);
    }

    return result;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);

    properties
        .add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', widget.margin));
    properties.add(
        DiagnosticsProperty<EdgeInsetsGeometry>('padding', widget.padding));
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
