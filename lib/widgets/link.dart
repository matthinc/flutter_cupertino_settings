part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSLink extends CSWidget {
  final String text;
  final VoidCallback pressed;
  final double fontSize;
  final bool useDarkForegroundColor;

  CSLink(
    this.text,
    this.pressed, {
    this.useDarkForegroundColor = false,
    CSWidgetStyle style = CS_DEFAULT_STYLE,
    this.fontSize = CS_HEADER_FONT_SIZE,
  }) : super(
          CupertinoButton(
            padding: EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(
                    color: useDarkForegroundColor ? CupertinoColors.extraLightBackgroundGray : CS_TEXT_COLOR,
                    fontSize: fontSize,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: useDarkForegroundColor ? CupertinoColors.extraLightBackgroundGray : Colors.black26,
                ),
              ],
            ),
            onPressed: pressed,
          ),
          style: style,
        );
}
