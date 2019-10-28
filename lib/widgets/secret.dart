part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSSecret extends StatefulWidget {
  final String text;
  final String pressed;
  final double fontSize;
  final CSWidgetStyle style;

  CSSecret(
    this.text,
    this.pressed, {
    this.style = CS_DEFAULT_STYLE,
    this.fontSize = CS_HEADER_FONT_SIZE,
  });

  @override
  _CSSecretState createState() => _CSSecretState();
}

class _CSSecretState extends State<CSSecret> {
  bool _show = false;

  @override
  Widget build(BuildContext context) {
    return CSWidget(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            widget.text,
            style: TextStyle(
              color: _isDark(context) ? CupertinoColors.extraLightBackgroundGray : CS_TEXT_COLOR,
              fontSize: widget.fontSize,
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                _show ? widget.text : RenderEditable.obscuringCharacter * widget.text.length,
                style: TextStyle(
                  color: _isDark(context) ? CupertinoColors.extraLightBackgroundGray : CS_TEXT_COLOR,
                  fontSize: widget.fontSize,
                ),
              ),
              CupertinoButton(
                child: Icon(
                  CupertinoIcons.eye_solid,
                  color: _isDark(context) ? CupertinoColors.extraLightBackgroundGray : Colors.black26,
                  size: CS_CHECK_SIZE,
                ),
                onPressed: () => setState(() => _show = !_show),
              ),
            ],
          ),
        ],
      ),
      style: widget.style,
    );
  }
}
