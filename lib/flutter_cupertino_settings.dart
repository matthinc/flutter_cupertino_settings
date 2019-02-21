library flutter_cupertino_settings;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

part 'widgets/button.dart';
part 'widgets/control.dart';
part 'widgets/header.dart';
part 'widgets/link.dart';
part 'widgets/selection.dart';
part 'widgets/widget.dart';

const double CS_ITEM_HEIGHT = 50.0;
const Color CS_HEADER_COLOR = Color(0xFFEEEEF3);
const Color CS_BORDER_COLOR = Colors.black12;
const Color CS_TEXT_COLOR = Colors.black;
const Color CS_HEADER_TEXT_COLOR = Colors.black54;
const EdgeInsets CS_ITEM_PADDING = EdgeInsets.only(left: 10.0, right: 10.0);
const double CS_HEADER_FONT_SIZE = 14.0;
const double CS_ITEM_NAME_SIZE = 16.0;
const double CS_BUTTON_FONT_SIZE = CS_ITEM_NAME_SIZE;
const EdgeInsets CS_ICON_PADDING = EdgeInsets.only(right: 10.0);
const CSWidgetStyle CS_DEFAULT_STYLE = CSWidgetStyle();
const Color CS_CHECK_COLOR = Colors.blue;
const double CS_CHECK_SIZE = 16.0;

/// Event for [CSSelection]
typedef void SelectionCallback(int selected);

class CupertinoSettings extends StatelessWidget {
  final List<Widget> items;
  CupertinoSettings(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return items[index];
      },
    );
  }
}
