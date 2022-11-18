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
  const Gap({
    Key? key,
    this.flex = 1,
    this.size,
  }) : super(key: key);

  const Gap.size(double value, [Key? key])
      : size = value,
        flex = 1,
        super(key: key);

  const Gap.flex([this.flex = 1, Key? key])
      : size = null,
        super(key: key);

  /// The flex factor to use in determining how much space to take up.
  ///
  /// The amount of space the [Gap] can occupy in the main axis is determined
  /// by dividing the free space proportionately, after placing the inflexible
  /// children, according to the flex factors of the flexible children.
  ///
  /// Defaults to one.
  final int flex;

  final double? size;

  @override
  Widget build(BuildContext context) {
    if (size != null) return _Gap(size!);

    return Expanded(
      flex: flex,
      child: const SizedBox.shrink(),
    );
  }
}

class _Gap extends LeafRenderObjectWidget {
  const _Gap(this.size, {Key? key})
      : assert(size >= 0 && size < double.infinity),
        super(key: key);

  final double size;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderGap(size);
  }

  @override
  void updateRenderObject(BuildContext context, _RenderGap renderObject) {
    renderObject.extent = size;
  }
}

class _RenderGap extends RenderBox {
  _RenderGap(double extent) : _extent = extent;

  double get extent => _extent;
  double _extent;
  set extent(double value) {
    if (_extent != value) {
      _extent = value;
      markNeedsLayout();
    }
  }

  @override
  void performLayout() {
    final flex = parent;
    if (flex is RenderFlex) {
      if (flex.direction == Axis.horizontal) {
        size = constraints.constrain(Size(extent, 0));
      } else {
        size = constraints.constrain(Size(0, extent));
      }
    } else {
      throw FlutterError(
        'A Gap widget must be placed directly inside a Flex widget',
      );
    }
  }
}
