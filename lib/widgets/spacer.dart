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
      padding: const EdgeInsets.only(left: 10.0, top: 20.0, bottom: 5.0),
      decoration: BoxDecoration(
        // color: _isDark(context) ? backgroundColorDark : CS_HEADER_COLOR_LIGHT,
        color: _isDark(context) ? CupertinoColors.systemBackground.resolveFrom(context) : CupertinoColors.secondarySystemBackground.resolveFrom(context),
        border: Border(
          bottom: showBorder
              ? BorderSide(
                  color: _isDark(context) ? CupertinoColors.inactiveGray : CS_BORDER_COLOR,
                  width: _isDark(context) ? CS_BORDER_HEIGHT_DARK : CS_BORDER_HEIGHT_LIGHT,
                )
              : BorderSide.none,
        ),
      ),
    );
  }
}
