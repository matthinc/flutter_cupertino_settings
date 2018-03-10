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
const CS_BUTTON_FONT_SIZE = CS_ITEM_NAME_SIZE;

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

/// This widgets is used as a grouping separator.
/// The [title] attribute is optional.
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

/// Used to display a widget of any kind in [CupertinoSettings]
/// It provices the correct height, color and border to create the intended look
/// The optional [alignment] attribute allows to specify the aligment inside the container
class CSWidget extends StatelessWidget {
  final Widget widget;
  final AlignmentGeometry alignment;
  CSWidget(this.widget, {this.alignment});

  @override
  Widget build(BuildContext context) {
    return new Container(
        alignment: alignment,
        height: CS_ITEM_HEIGHT,
        padding: CS_ITEM_PADDING,
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
              bottom: new BorderSide(color: CS_BORDER_COLOR, width: 1.0)
          ),
        ),
        child: widget
    );
  }

}

/// A title [name] in combination with any widget [contentWidget]
/// extends [CSWidget]
/// Provides the correct paddings and text properties
class CSControl extends CSWidget {
  final String name;
  final Widget contentWidget;

  CSControl(this.name, this.contentWidget) : super(
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Text(name, style: new TextStyle(fontSize: CS_ITEM_NAME_SIZE, color: CS_TEXT_COLOR)),
          contentWidget
        ],
      )
  );
}

/// A button-cell inside [CupertinoSettings]
/// 3 different types are available (they only affect the design):
/// [CSButtonType.DESTRUCTIVE] Red and centered
/// [CSButtonType.DEFAULT] Blue and left aligned
/// [CSButtonType.DEFAULT_CENTER] Blue and centered
/// Provides the correct paddings and text properties
class CSButton extends CSWidget {
  final CSButtonType type;
  final String text;
  final VoidCallback pressed;
  CSButton(this.type, this.text, this.pressed) : super(
      new CupertinoButton(
          padding: EdgeInsets.zero,
          child: new Text(text, style: new TextStyle(color: type.color, fontSize: CS_BUTTON_FONT_SIZE)),
          onPressed: pressed
      ),
      alignment: type.alignment
  );
}

/// Defines different types for [CSButton]
/// Specifies color and alignment
class CSButtonType {
  static const DESTRUCTIVE = const CSButtonType(Colors.red, AlignmentDirectional.center);
  static const DEFAULT = const CSButtonType(Colors.blue, AlignmentDirectional.centerStart);
  static const DEFAULT_CENTER = const CSButtonType(Colors.blue, AlignmentDirectional.center);

  final Color color;
  final AlignmentGeometry alignment;

  const CSButtonType(this.color, this.alignment);
}
