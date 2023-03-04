import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Spacer creates an adjustable, empty spacer that can be used to tune the
/// spacing between widgets in a [Flex] container, like [Row] or [Column].
///
/// The [Gap] widget will take up any available space, so setting the
/// [Flex.mainAxisAlignment] on a flex container that contains a [Gap] to
/// [MainAxisAlignment.spaceAround], [MainAxisAlignment.spaceBetween], or
/// [MainAxisAlignment.spaceEvenly] will not have any visible effect: the
/// [Gap] has taken up all of the additional space, therefore there is none
/// left to redistribute.
///
/// {@tool snippet}
///
/// ```dart
/// Row(
///   children: const <Widget>[
///     Text('Begin'),
///     Spacer(), // Defaults to a flex of one.
///     Text('Middle'),
///     // Gives twice the space between Middle and End than Begin and Middle.
///     Spacer(flex: 2),
///     Text('End'),
///   ],
/// )
/// ```
/// {@end-tool}
///
/// {@youtube 560 315 https://www.youtube.com/watch?v=7FJgd7QN1zI}
///
/// See also:
///
///  * [Row] and [Column], which are the most common containers to use a Spacer
///    in.
///  * [SizedBox], to create a box with a specific size and an optional child.
class Gap extends StatelessWidget {
  const Gap(
    this.size, {
    Key? key,
  }) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
    final scrollableState = Scrollable.maybeOf(context);
    final direction = scrollableState?.axisDirection;
    final axis = direction != null ? axisDirectionToAxis(direction) : null;
    return _Gap(size, axis);
  }
}

class _Gap extends LeafRenderObjectWidget {
  const _Gap(
    this.extent,
    this.direction,
  ) : assert(extent >= 0 && extent < double.infinity);

  final double extent;

  final Axis? direction;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderGap(extent, direction);
  }

  @override
  void updateRenderObject(BuildContext context, _RenderGap renderObject) {
    renderObject
      ..extent = extent
      ..direction = direction;
  }
}

class _RenderGap extends RenderBox {
  _RenderGap(
    double extent,
    Axis? direction,
  )   : _extent = extent,
        _direction = direction;

  double get extent => _extent;
  double _extent;
  set extent(double value) {
    if (_extent != value) {
      _extent = value;
      markNeedsLayout();
    }
  }

  Axis? get direction => _direction;
  Axis? _direction;
  set direction(Axis? value) {
    if (_direction != value) {
      _direction = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    final p = parent;

    Axis? axis = direction;
    if (p is RenderFlex) {
      axis = p.direction;
    }

    if (axis == null) {
      throw FlutterError(
        'A Gap widget must be placed directly inside a Flex or Scrollable widget',
      );
    }

    if (axis == Axis.horizontal) {
      size = constraints.constrain(Size(extent, 0));
    } else {
      size = constraints.constrain(Size(0, extent));
    }
  }
}
