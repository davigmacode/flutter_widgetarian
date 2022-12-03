import 'package:flutter/widgets.dart';

class ConstrainedText extends StatelessWidget {
  const ConstrainedText(
    this.data, {
    Key? key,
    this.style,
    this.trailing,
    this.minLines,
    this.maxLines,
    this.maxLength,
  }) : super(key: key);

  final String data;
  final TextStyle? style;
  final TextSpan? trailing;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;

  String generateNewLines(int count) {
    final sb = StringBuffer();
    for (var i = 0; i < count - 1; i++) {
      sb.write("\n");
    }
    return sb.toString();
  }

  @override
  Widget build(BuildContext context) {
    // if (maxLength != null) {
    //   assert(maxLength! <= data.length);
    // }

    final textTheme = DefaultTextStyle.of(context);
    final textStyle = textTheme.style.merge(style);

    bool exceedLimit = maxLength != null && maxLength! <= data.length;

    final trailingSpan = trailing ??
        TextSpan(
          text: '...',
          style: textStyle,
        );

    final mainSpan = TextSpan(
      text: exceedLimit ? data.substring(0, maxLength) : data,
      style: textStyle,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        assert(constraints.hasBoundedWidth);

        // Layout and measure trailing span
        final textPainter = TextPainter(
          text: trailingSpan,
          maxLines: maxLines,
          textDirection: Directionality.of(context),
        );
        // textPainter.setPlaceholderDimensions([
        //   const PlaceholderDimensions(
        //     size: Size.zero,
        //     alignment: PlaceholderAlignment.baseline,
        //   ),
        // ]);
        textPainter.layout(
          minWidth: 0,
          maxWidth: constraints.maxWidth,
        );
        final trailingSize = textPainter.size;

        // Layout and measure main span
        textPainter.text = mainSpan;
        textPainter.layout(
          minWidth: constraints.minWidth,
          maxWidth: constraints.maxWidth,
        );
        final mainSize = textPainter.size;

        // Find the last index
        final pos = textPainter.getPositionForOffset(Offset(
          mainSize.width - trailingSize.width,
          mainSize.height,
        ));
        final lastIndex = textPainter.getOffsetBefore(pos.offset);

        exceedLimit |= textPainter.didExceedMaxLines;

        String linesExtend = '';
        if (minLines != null) {
          final linesCount = textPainter.computeLineMetrics().length;
          final linesNeeded = minLines! - linesCount;
          linesExtend = generateNewLines(linesNeeded);
        }

        return RichText(
          text: TextSpan(
            style: textStyle,
            children: [
              TextSpan(
                text: exceedLimit ? data.substring(0, lastIndex) : data,
              ),
              if (exceedLimit) trailingSpan,
              if (linesExtend.isNotEmpty) TextSpan(text: linesExtend),
            ],
          ),
        );
      },
    );
  }
}
