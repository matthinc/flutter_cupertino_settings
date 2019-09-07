part of flutter_cupertino_settings;

class CSSpacer extends StatelessWidget {
  final Color backgroundColorDark;
  final bool showBorder;

  const CSSpacer({
    Key key,
    this.backgroundColorDark = Colors.black12,
    this.showBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: _isDark(context) ? backgroundColorDark : CS_HEADER_COLOR,
        border: Border(
          bottom: showBorder
              ? BorderSide(
                  color: _isDark(context) ? CupertinoColors.inactiveGray : CS_BORDER_COLOR,
                  width: CS_BORDER_HEIGHT,
                )
              : BorderSide.none,
        ),
      ),
    );
  }
}
