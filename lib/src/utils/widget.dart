import 'package:flutter/widgets.dart';

class NullWidget extends StatelessWidget {
  const NullWidget([Key? key]) : super(key: key);

  @override
  Widget build(BuildContext context) {
    throw FlutterError(
      'An Object extends InheritedTheme constructed with Object.fallback cannot be incorporated into the widget tree, it is meant only to provide a fallback value returned by Object.of() when no enclosing Object is present in a BuildContext.',
    );
  }
}
