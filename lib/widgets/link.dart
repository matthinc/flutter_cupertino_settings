part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSLink extends CSWidget {
  final String text;
  final VoidCallback pressed;
  final double fontSize;

  CSLink(this.text, this.pressed,
      {CSWidgetStyle style = CS_DEFAULT_STYLE,
      this.fontSize = CS_HEADER_FONT_SIZE})
      : super(
            CupertinoButton(
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(text,
                        style: TextStyle(
                          color: CS_TEXT_COLOR,
                          fontSize: fontSize,
                        )),
                    const Icon(Icons.keyboard_arrow_right,
                        color: Colors.black26)
                  ],
                ),
                onPressed: pressed),
            style: style);
}
