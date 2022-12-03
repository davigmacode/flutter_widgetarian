import 'package:flutter/material.dart'
    hide ListTile, ListTileStyle, Spacer, AnimatedIcon, ExpansionPanel;
import 'package:widgetarian/layout.dart';
import 'package:widgetarian/feedback.dart';
import '../template.dart';

class TilePage extends StatefulWidget {
  const TilePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<TilePage> createState() => _TilePageState();
}

class _TilePageState extends State<TilePage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Box(
                color: Colors.black12,
                child: Wrap(
                  children: const [
                    AnimatedCheckmark(
                      fill: Colors.blue,
                      color: Colors.white,
                      size: 24,
                      value: true,
                    ),
                    Text('Remember me'),
                    Icon(Icons.close),
                  ],
                ),
              ),
              const Gap(10),
              const Box(
                color: Colors.black12,
                // height: 40,
                child: Tile(
                  // leading: CircleAvatar(
                  //   backgroundImage: NetworkImage('https://i.pravatar.cc/50'),
                  // ),
                  // forceSpacing: false,
                  spacing: 15,
                  leading: AnimatedCheckmark(
                    fill: Colors.blue,
                    color: Colors.white,
                    size: 24,
                    value: true,
                  ),
                  trailing: Icon(Icons.close),
                  child: TextTile(
                    title: Text('Remember me'),
                    subtitle: Text(
                      'Following the Material Design Guidelines, Layout encourage consistency across platforms,',
                    ),
                  ),
                ),
              ),
              const Gap(10),
              const Box(
                color: Colors.black12,
                child: ListTile(
                  style: ListTileStyle(
                    // alignItems: CrossAxisAlignment.start,
                    padding: EdgeInsets.all(20),
                    spacing: 5,
                  ),
                  title: Text('Remember me'),
                  subtitle: Text(
                    'Following the Material Design Guidelines, Layout encourage consistency across platforms,',
                  ),
                  leading: AnimatedCheckmark(
                    fill: Colors.blue,
                    color: Colors.white,
                    size: 24,
                    value: true,
                  ),
                  trailing: Icon(Icons.close),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
