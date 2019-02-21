part of flutter_cupertino_settings;

/// A title [name] in combination with any widget [contentWidget]
/// extends [CSWidget]
/// Provides the correct paddings and text properties
class CSControl extends CSWidget {
  final String name;
  final Widget contentWidget;
  final double fontSize;

  CSControl(
    this.name,
    this.contentWidget, {
    CSWidgetStyle style = CS_DEFAULT_STYLE,
    this.fontSize = CS_HEADER_FONT_SIZE,
  }) : super(
            _ControlWidget(
              fontSize: fontSize,
              contentWidget: contentWidget,
              name: name,
            ),
            style: style);
}

class _ControlWidget extends StatelessWidget {
  final String name;
  final Widget contentWidget;
  final double fontSize;

  const _ControlWidget({
    Key key,
    this.fontSize,
    this.contentWidget,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(name,
            style: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? null
                  : CS_TEXT_COLOR,
              fontSize: fontSize,
            )),
        contentWidget
      ],
    );
  }
}
