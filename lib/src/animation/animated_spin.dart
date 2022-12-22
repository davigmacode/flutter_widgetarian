import 'package:flutter/widgets.dart';

class AnimatedSpin extends StatefulWidget {
  const AnimatedSpin({
    Key? key,
    this.enabled = true,
    this.clockwise = true,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.linear,
    required this.child,
  }) : super(key: key);

  final bool enabled;
  final bool clockwise;
  final Duration duration;
  final Curve curve;
  final Widget child;

  @override
  State<AnimatedSpin> createState() => AnimatedSpinState();
}

class AnimatedSpinState extends State<AnimatedSpin>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  final Tween<double> reverseTween = Tween<double>(
    begin: 1,
    end: 0,
  );

  @protected
  void initController(Duration duration) {
    controller = AnimationController(
      duration: duration,
      vsync: this,
    );
  }

  @protected
  void initAnimation(Curve curve) {
    animation = CurvedAnimation(
      parent: controller,
      curve: curve,
    );
  }

  @protected
  void toggleAnimation() {
    if (widget.enabled) {
      controller.repeat();
    } else {
      controller.reset();
    }
  }

  @override
  void initState() {
    initController(widget.duration);
    initAnimation(widget.curve);
    super.initState();
    toggleAnimation();
  }

  @override
  void didUpdateWidget(covariant AnimatedSpin oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.duration != widget.duration) {
      initController(widget.duration);
      initAnimation(widget.curve);
    }

    if (oldWidget.curve != widget.curve) {
      initAnimation(widget.curve);
    }

    if (oldWidget.enabled != widget.enabled) {
      toggleAnimation();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: widget.clockwise ? animation : reverseTween.animate(controller),
      child: widget.child,
    );
  }
}
