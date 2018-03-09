library flutter_cupertino_settings;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

const CS_ITEM_HEIGHT = 50.0;
const CS_HEADER_COLOR = const Color(0xFFEEEEF3);
const CS_BORDER_COLOR = Colors.black12;
const CS_TEXT_COLOR = Colors.black;
const CS_HEADER_TEXT_COLOR = Colors.black54;
const CS_ITEM_PADDING = const EdgeInsets.only(left: 10.0, right: 10.0);
const CS_HEADER_FONT_SIZE = 14.0;
const CS_ITEM_NAME_SIZE = 16.0;

class CupertinoSettings extends StatelessWidget {
  final List<Widget> items;
  CupertinoSettings(this.items);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
  }
}

class CSHeader extends StatelessWidget {
  final String title;
  CSHeader([this.title = '']);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
      child: new Text(title.toUpperCase(), style: new TextStyle(color: CS_HEADER_TEXT_COLOR, fontSize: CS_HEADER_FONT_SIZE)),
      decoration: new BoxDecoration(
          color: CS_HEADER_COLOR,
          border: new Border(
              bottom: new BorderSide(color: CS_BORDER_COLOR, width: 1.0)
          )
      ),
    );
  }
}

class CSControl extends StatelessWidget {
  final String name;
  final Widget widget;
  CSControl(this.name, this.widget);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: CS_ITEM_HEIGHT,
      padding: CS_ITEM_PADDING,
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
            bottom: new BorderSide(color: CS_BORDER_COLOR, width: 1.0)
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Text(name, style: new TextStyle(fontSize: CS_ITEM_NAME_SIZE, color: CS_TEXT_COLOR)),
          widget
        ],
      ),
    );
  }
}
