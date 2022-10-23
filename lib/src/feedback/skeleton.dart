import 'package:flutter/widgets.dart';

const kSkeletonColor = Color(0xFFCFD8DC);

class SkeletonImage extends StatelessWidget {
  const SkeletonImage({
    Key? key,
    this.width,
    this.height,
    this.margin,
    this.borderRadius = 0,
    this.color = kSkeletonColor,
  }) : super(key: key);

  final double? width;
  final double? height;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}

class SkeletonText extends StatelessWidget {
  const SkeletonText({
    Key? key,
    this.width,
    this.height = 10.0,
    this.margin,
    this.color = kSkeletonColor,
  }) : super(key: key);

  final double? width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      color: color,
    );
  }
}

class SkeletonParagraph extends StatelessWidget {
  const SkeletonParagraph({
    Key? key,
    this.lines = 2,
    this.width,
    this.height = 10.0,
    this.spacing = 5.0,
    this.margin,
    this.color = kSkeletonColor,
  }) : super(key: key);

  final int lines;
  final double? width;
  final double? height;
  final double spacing;
  final Color color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: margin,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List<Widget>.generate(lines, (i) {
          final bool isLast = i == lines - 1;
          return FractionallySizedBox(
            widthFactor: !isLast || lines == 1 ? 1.0 : 0.5,
            child: Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(bottom: !isLast ? spacing : 0),
              height: height,
              color: color,
            ),
          );
        }).toList(),
      ),
    );
  }
}
