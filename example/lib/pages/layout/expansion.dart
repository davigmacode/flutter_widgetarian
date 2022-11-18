import 'package:flutter/material.dart'
    hide ListTile, ListTileStyle, Spacer, AnimatedIcon, ExpansionPanel;
import 'package:widgetarian/layout.dart';
import '../template.dart';

class ExpansionPage extends StatefulWidget {
  const ExpansionPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<ExpansionPage> createState() => _ExpansionPageState();
}

class _ExpansionPageState extends State<ExpansionPage> {
  @override
  Widget build(BuildContext context) {
    return PageTemplate(
      title: widget.title,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 500,
                    child: Expansion(
                      value: true,
                      header: ExpansionHeader(
                        title: Text('What is Lorem Ipsum?'),
                        trailing: ExpansionIcon(),
                      ),
                      divider: Divider(),
                      child: ExpansionScrollView(
                        constraints: BoxConstraints(maxHeight: 100),
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gap.size(10),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 500,
                    child: Expansion(
                      value: false,
                      header: ExpansionHeader(
                        title: Text('What is Lorem Ipsum?'),
                        trailing: ExpansionIcon(
                          icon: Icons.arrow_drop_down_rounded,
                        ),
                      ),
                      collapsed: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      ),
                    ),
                  ),
                ),
              ),
              Gap.size(10),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 500,
                    child: Expansion(
                      value: false,
                      collapsed: ExpansionButton(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      child: ExpansionButton(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Gap.size(10),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: 500,
                    child: Expansion(
                      value: false,
                      // divider: Divider(),
                      header: ExpansionHeader(
                        title: Text('Menu'),
                        trailing: ExpansionIcon(),
                      ),
                      child: ExpansionMenu(
                        children: [
                          ListTile(title: Text('Menu Item')),
                          ListTile(title: Text('Menu Item')),
                          Expansion(
                            // divider: Divider(),
                            header: ExpansionHeader(
                              title: Text('Nested Menu'),
                              trailing: ExpansionIcon(),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                              child: ExpansionMenu(
                                children: [
                                  ListTile(title: Text('Menu Item')),
                                  ListTile(title: Text('Menu Item')),
                                  Expansion(
                                    header: ExpansionHeader(
                                      title: Text('Nested Menu'),
                                      trailing: ExpansionIcon(),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: ExpansionMenu(
                                        children: [
                                          ListTile(title: Text('Menu Item')),
                                          ListTile(title: Text('Menu Item')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
