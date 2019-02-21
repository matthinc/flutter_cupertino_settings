part of flutter_cupertino_settings;

/// A title [name] in combination with any widget [contentWidget]
/// extends [CSWidget]
/// Provides the correct paddings and text properties
class CSControl extends CSWidget {
  final String name;
  final Widget contentWidget;
  final double fontSize;

  CSControl(this.name, this.contentWidget,
      {CSWidgetStyle style = CS_DEFAULT_STYLE,
      this.fontSize = CS_HEADER_FONT_SIZE})
      : super(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name,
                    style: TextStyle(
                      color: CS_TEXT_COLOR,
                      fontSize: fontSize,
                    )),
                contentWidget
              ],
            ),
            style: style);
}
