part of flutter_cupertino_settings;

/// A title [name] in combination with any widget [contentWidget]
/// extends [CSWidget]
/// Provides the correct paddings and text properties
class CSControl extends CSWidget {
  final String name;
  final Widget contentWidget;
  final double fontSize;

  CSControl({
    this.name,
    this.contentWidget,
    CSWidgetStyle style = CS_DEFAULT_STYLE,
    this.fontSize = CS_TITLE_FONT_SIZE,
    bool addPaddingToBorder = true,
  }) : super(
          _ControlWidget(
            fontSize: fontSize,
            contentWidget: contentWidget,
            name: name,
          ),
          style: style,
          addPaddingToBorder: addPaddingToBorder,
        );
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
        Text(
          name,
          style: basicTextStyle(context).copyWith(
            color: CupertinoColors.label.resolveFrom(context),
            fontSize: fontSize,
          ),
        ),
        DefaultTextStyle(
          style: basicTextStyle(context).copyWith(
            color: CupertinoColors.label.resolveFrom(context),
            fontSize: fontSize,
          ),
          child: contentWidget,
        ),
      ],
    );
  }
}
