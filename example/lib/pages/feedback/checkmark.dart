import 'package:flutter/material.dart';
import 'package:widgetarian/feedback.dart';
import '../template.dart';

class CheckmarkPage extends StatefulWidget {
  const CheckmarkPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<CheckmarkPage> createState() => _CheckmarkPageState();
}

class _CheckmarkPageState extends State<CheckmarkPage> {
  bool _active = true;
  bool _shrink = true;
  bool _sharp = true;
  Color? _color;

  bool? _check;

  void toggleActive() {
    setState(() => _active = !_active);
  }

  void toggleShrink() {
    setState(() => _shrink = !_shrink);
  }

  void toggleSharp() {
    setState(() => _sharp = !_sharp);
  }

  void setColor(Color color) {
    setState(() => _color = color);
  }

  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedCheckmark(
              value: _check,
              weight: _shrink ? 2 : 30,
              size: _shrink ? 18 : 200,
              color: _color,
              fill: Colors.white,
              // padding: 30,
              // shape: const CircleBorder(),
              style: _sharp ? StrokeStyle.sharp : StrokeStyle.round,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: _shrink ? 18 : 180,
              height: _shrink ? 18 : 180,
              child: AnimatedRadiomark(
                padding: _check == true ? .45 : 1,
                color: _color ?? Colors.transparent,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: _color ?? const Color(0xFF000000),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            AnimatedSwitchmark(
              value: _check,
              thumbInset: 3,
              thumbSize: .8,
              trackColor: _color,
              size: const Size(33, 20),
            ),
            const SizedBox(height: 10),
            AnimatedSwitchmark(
              value: _check,
              thumbInset: 3,
              thumbSize: .8,
              thumbColor: _color,
              thumbShape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.zero,
              ),
              trackColor: _color?.withOpacity(.3),
              // trackShape: RoundedRectangleBorder(
              //   side: BorderSide(
              //     width: 2,
              //     color: _color ?? Colors.black,
              //   ),
              //   borderRadius: BorderRadius.circular(2),
              // ),
              size: const Size(33, 20),
            ),
            const SizedBox(height: 10),
            AnimatedSwitchmark(
              value: _check,
              thumbShape: CircleBorder(
                side: BorderSide(
                  color: _color ?? Colors.black,
                  style: BorderStyle.none,
                  width: 2,
                ),
              ),
              thumbInset: -1,
              thumbSize: .8,
              trackHeight: .5,
              trackColor: _color,
              size: const Size(33, 20),
            ),
            const SizedBox(height: 10),
            Checkbox(
              value: _check,
              tristate: true,
              onChanged: (value) => setState(() => _check = value),
            ),
            const SizedBox(height: 10),
            Wrap(
              children: [
                TextButton(
                  onPressed: toggleActive,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _active ? const Text('Hide') : const Text('Show'),
                  ),
                ),
                TextButton(
                  onPressed: toggleShrink,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child:
                        _shrink ? const Text('Expand') : const Text('Shrink'),
                  ),
                ),
                TextButton(
                  onPressed: toggleSharp,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: _sharp ? const Text('Round') : const Text('Sharp'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: 200,
              alignment: Alignment.center,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: Colors.primaries.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  crossAxisCount: 6,
                ),
                itemBuilder: (_, i) {
                  final color = Colors.primaries[i];
                  return Card(
                    color: color,
                    child: InkWell(
                      onTap: () => setColor(color),
                      child: AnimatedCheckmark(
                        weight: 4,
                        color: Colors.white70,
                        value: _color == color,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
