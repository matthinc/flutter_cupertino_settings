library flutter_cupertino_settings;

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Colors, Theme;
import 'package:flutter/cupertino.dart';

part 'widgets/button.dart';
part 'widgets/control.dart';
part 'widgets/description.dart';
part 'widgets/header.dart';
part 'widgets/link.dart';
part 'widgets/selection.dart';
part 'widgets/spacer.dart';
part 'widgets/widget.dart';

const double CS_ITEM_HEIGHT = 50.0;
const double CS_BORDER_HEIGHT_DARK = 0.45;
const double CS_BORDER_HEIGHT_LIGHT = 0.65;
const Color CS_HEADER_COLOR_LIGHT = CupertinoColors.extraLightBackgroundGray; // Color(0xFFF2F2F7)
const Color CS_BORDER_COLOR = Colors.black12;
const Color CS_TEXT_COLOR = Colors.black;
const Color CS_HEADER_TEXT_COLOR = Colors.black54;
const Color CS_SUBTITLE_TEXT_COLOR_LIGHT = Color(0xFF9C9C9F);
const EdgeInsets CS_ITEM_PADDING = EdgeInsets.symmetric(horizontal: 10, vertical: 1);
const double CS_TITLE_FONT_SIZE = 16.0;
const double CS_SUBTITLE_FONT_SIZE = 11.0;
const double CS_HEADER_FONT_SIZE = 14.0;
const double CS_DESCRIPTION_FONT_SIZE = 13.0;
const double CS_ITEM_NAME_SIZE = 15.0;
const EdgeInsets CS_ICON_PADDING = EdgeInsets.only(right: 10.0);
const CSWidgetStyle CS_DEFAULT_STYLE = CSWidgetStyle();
const Color CS_CHECK_COLOR = Colors.blue;
const double CS_CHECK_SIZE = 22.0;

/// Event for [CSSelection]
typedef void SelectionCallback(int selected);

/// Simple help function for determining the theme brightness
bool _isDark(BuildContext context) => _isIOSDark(context) || Theme.of(context).brightness == Brightness.dark;

bool _isIOSDark(BuildContext context) => CupertinoTheme.of(context).brightness == Brightness.dark;

TextStyle basicTextStyle(BuildContext context) =>
    Platform.isIOS ? CupertinoTheme.of(context).textTheme.textStyle : Theme.of(context).textTheme.subhead;

class CupertinoSettings extends StatelessWidget {
  final List<Widget> items;
  final bool shrinkWrap;

  CupertinoSettings({
    @required this.items,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: _isDark(context) ? Colors.black12 : CupertinoColors.extraLightBackgroundGray, // Color(0x33787880),
      color: _isIOSDark(context) ? CupertinoColors.systemBackground.resolveFrom(context) : CupertinoColors.secondarySystemBackground.resolveFrom(context),
      child: SafeArea(
        bottom: false,
        child: shrinkWrap
            ? ListView.builder(
                shrinkWrap: shrinkWrap,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) => items[index],
              )
            : Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: shrinkWrap,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) => items[index],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
