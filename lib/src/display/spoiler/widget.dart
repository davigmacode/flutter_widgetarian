import 'package:flutter/widgets.dart';
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/text.dart';

class Spoiler extends StatefulWidget {
  const Spoiler(
    this.data, {
    Key? key,
    this.value = false,
    this.onChanged,
    this.moreText = '...Show More',
    this.lessText = '',
    this.trimLines,
    this.trimLength,
  }) : super(key: key);

  final String data;
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String moreText;
  final String lessText;
  final int? trimLines;
  final int? trimLength;

  @override
  State<Spoiler> createState() => _SpoilerState();
}

class _SpoilerState extends State<Spoiler> {
  bool _expanded = false;

  void _toggle([bool? value]) {
    setState(() {
      _expanded = value ?? !_expanded;
      widget.onChanged?.call(_expanded);
    });
  }

  @override
  void initState() {
    _expanded = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Spoiler oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value) {
      _expanded = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = DefaultTextStyle.of(context);
    return Expansion(
      value: _expanded,
      onChanged: _toggle,
      collapsed: ExpansionButton(
        child: ConstrainedText(
          widget.data,
          maxLength: widget.trimLength,
          maxLines: widget.trimLines,
          style: textTheme.style,
          trailing: TextSpan(
            text: widget.moreText,
            style: textTheme.style,
          ),
        ),
      ),
      child: ExpansionButton(
        child: RichText(
          text: TextSpan(
            style: textTheme.style,
            children: [
              TextSpan(text: widget.data),
              TextSpan(text: widget.lessText),
            ],
          ),
        ),
      ),
    );
  }
}
