import 'dart:math';
import 'package:flutter/widgets.dart';

typedef StackedInfoBuilder = Widget Function(
  BuildContext context,
  int remaining,
);

enum StackedAlign { start, center, end }

class StackedGroup extends StatelessWidget {
  const StackedGroup({
    Key? key,
    this.direction = Axis.horizontal,
    this.align = StackedAlign.center,
    this.minCoverage = .5,
    this.maxCoverage = .9,
    this.itemMax,
    required this.itemSize,
    required this.itemLength,
    required this.itemBuilder,
    this.infoBuilder,
  })  : assert(minCoverage > 0 && maxCoverage >= minCoverage),
        assert(itemLength >= 0),
        super(key: key);

  final Axis direction;
  final StackedAlign align;
  final double minCoverage;
  final double maxCoverage;
  final Size itemSize;
  final int? itemMax;
  final int itemLength;
  final IndexedWidgetBuilder itemBuilder;
  final StackedInfoBuilder? infoBuilder;

  bool get isHorizontal => direction == Axis.horizontal;
  bool get isVertical => !isHorizontal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isVertical ? itemSize.width : null,
      height: isHorizontal ? itemSize.height : null,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double itemExtent =
              isHorizontal ? itemSize.width : itemSize.height;
          final double itemExtentMax = itemExtent * maxCoverage;
          final double itemExtentMin = itemExtent * minCoverage;
          final double itemTrailExtent = itemExtent - itemExtentMin;

          final double maxExtent =
              isHorizontal ? constraints.maxWidth : constraints.maxHeight;
          final double allowedExtent = maxExtent - itemTrailExtent;
          final int itemAllowed = allowedExtent ~/ itemExtentMin;
          final int itemLimit = itemMax ?? itemLength;
          final int itemDisplay =
              [itemAllowed, itemLength, itemLimit].reduce(min);
          final int itemRemaining = itemLength - itemDisplay;

          final double takenSpace = itemDisplay * itemExtentMin;
          final double freeSpace = allowedExtent - takenSpace;
          final double itemSpace = freeSpace / (itemDisplay - 1);
          final double itemExtentSpace = itemExtentMin + itemSpace;
          final double itemExtentFinal = min(itemExtentSpace, itemExtentMax);

          final double takenSpaceAdjusted =
              (itemDisplay * itemExtentFinal) + (itemExtent - itemExtentFinal);
          final double freeSpaceAdjusted = maxExtent - takenSpaceAdjusted;
          final double firstOffset = align == StackedAlign.center
              ? freeSpaceAdjusted / 2
              : align == StackedAlign.end
                  ? freeSpaceAdjusted
                  : 0;

          // print(maxExtent);
          // print(takenSpaceAgain);
          // print(itemSpace);

          final bool hasInfo = itemRemaining > 0 && infoBuilder != null;
          if (itemDisplay <= 0) return const SizedBox();

          final List<Widget> children = List.generate(
            itemDisplay,
            (i) => Positioned(
              top: isVertical ? firstOffset + (i * itemExtentFinal) : null,
              left: isHorizontal ? firstOffset + (i * itemExtentFinal) : null,
              child: i == itemDisplay - 1 && hasInfo
                  ? infoBuilder!(context, itemRemaining + 1)
                  : itemBuilder(context, i),
            ),
            growable: false,
          );

          return Stack(children: children);
        },
      ),
    );
  }
}
