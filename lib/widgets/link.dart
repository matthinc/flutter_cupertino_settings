part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSLink extends StatelessWidget {
  final String text;
  final VoidCallback pressed;
  final double fontSize;
  final CSWidgetStyle style;

  CSLink(
    this.text,
    this.pressed, {
    this.style = CS_DEFAULT_STYLE,
    this.fontSize = CS_HEADER_FONT_SIZE,
  });

  @override
  Widget build(BuildContext context) {
    return CSWidget(
      CupertinoButton(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: _isDark(context) ? CupertinoColors.extraLightBackgroundGray : CS_TEXT_COLOR,
                fontSize: fontSize,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: _isDark(context) ? CupertinoColors.extraLightBackgroundGray : Colors.black26,
            ),
          ],
        ),
        onPressed: pressed,
      ),
      style: style,
    );
  }
}
