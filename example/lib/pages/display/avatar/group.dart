import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/display.dart';

import '../../sample.dart';

class AvatarGroupUsage extends StatefulWidget {
  const AvatarGroupUsage({Key? key}) : super(key: key);

  @override
  State<AvatarGroupUsage> createState() => _AvatarGroupUsageState();
}

class _AvatarGroupUsageState extends State<AvatarGroupUsage> {
  double _width = 500.0;

  void _setWidth(double value) {
    setState(() {
      _width = value;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setWidth(MediaQuery.of(context).size.width / 3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Sample(
      title: 'Grouped Usage',
      script: script,
      children: [
        Center(
          child: Container(
            color: Colors.black12,
            width: _width,
            child: Overlaid(
              minCoverage: 0.5,
              maxCoverage: 0.8,
              align: OverlaidAlign.center,
              leadIndex: 3,
              itemSize: const Size.square(44),
              itemLimit: 10,
              itemLength: 15,
              itemBuilder: (context, i) {
                return Box(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  padding: const EdgeInsets.all(2.0),
                  child: Avatar(
                    style: const AvatarStyle(
                      size: 40,
                      foregroundStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    image: NetworkImage('https://i.pravatar.cc/50?u=$i'),
                    child: Text(i.toString()),
                  ),
                );
              },
              infoBuilder: (context, remaining) {
                return Box(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  padding: const EdgeInsets.all(2.0),
                  child: Avatar(
                    style: const AvatarStyle(
                      backgroundColor: Colors.red,
                      foregroundStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    child: Text('+$remaining'),
                  ),
                );
              },
            ),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Slider(
              value: _width,
              min: constraints.minWidth,
              max: constraints.maxWidth,
              onChanged: _setWidth,
            );
          },
        ),
      ],
    );
  }
}

const script = '''double _width = 500.0;

void _setWidth(double value) {
  setState(() {
    _width = value;
  });
}

Column(
  children: [
    Center(
      child: Container(
        color: Colors.black12,
        width: _width,
        child: Overlaid(
          minCoverage: 0.5,
          maxCoverage: 0.8,
          align: OverlaidAlign.center,
          leadIndex: 3,
          itemSize: const Size.square(44),
          itemLimit: 10,
          itemLength: 15,
          itemBuilder: (context, i) {
            return Box(
              shape: BoxShape.circle,
              color: Colors.white,
              padding: const EdgeInsets.all(2.0),
              child: Avatar(
                style: const AvatarStyle(
                  size: 40,
                  foregroundStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                image: NetworkImage('https://i.pravatar.cc/50?u=\$i'),
                child: Text(i.toString()),
              ),
            );
          },
          infoBuilder: (context, remaining) {
            return Box(
              shape: BoxShape.circle,
              color: Colors.white,
              padding: const EdgeInsets.all(2.0),
              child: Avatar(
                style: const AvatarStyle(
                  backgroundColor: Colors.red,
                  foregroundStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                child: Text('+\$remaining'),
              ),
            );
          },
        ),
      ),
    ),
    LayoutBuilder(
      builder: (context, constraints) {
        return Slider(
          value: _width,
          min: constraints.minWidth,
          max: constraints.maxWidth,
          onChanged: _setWidth,
        );
      },
    ),
  ],
)''';
