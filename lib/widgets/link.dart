part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSLink extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback pressed;
  final double titleFontSize;
  final double subTitleFontSize;
  final CSWidgetStyle style;
  final bool addPaddingToBorder;
  final bool showTopBorder;

  CSLink(
    this.title,
    this.pressed, {
    this.subtitle,
    this.style = CS_DEFAULT_STYLE,
    this.titleFontSize = CS_TITLE_FONT_SIZE,
    this.subTitleFontSize = CS_SUBTITLE_FONT_SIZE,
    this.addPaddingToBorder = true,
    this.showTopBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final showSubtitle = subtitle != null && subtitle.isNotEmpty;

    return CSWidget(
      CupertinoButton(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: basicTextStyle(context).copyWith(
                      color: _isDark(context) ? CupertinoColors.white : CS_TEXT_COLOR,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (showSubtitle) SizedBox(height: 2),
                  if (showSubtitle)
                    Text(
                      subtitle,
                      style: basicTextStyle(context).copyWith(
                        color: _isDark(context) ? CupertinoColors.lightBackgroundGray : CS_HEADER_TEXT_COLOR,
                        fontSize: subTitleFontSize,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                    ),
                ],
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
      addPaddingToBorder: addPaddingToBorder,
      showTopBorder: showTopBorder,
    );
  }
}
