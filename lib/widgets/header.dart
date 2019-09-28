part of flutter_cupertino_settings;

/// This widgets is used as a grouping separator.
/// The [title] attribute is optional.
class CSHeader extends StatelessWidget {
  final String title;
  final Color backgroundColorDark;

  CSHeader(
    this.title, {
    this.backgroundColorDark = Colors.black12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
      child: Text(
        title.toUpperCase(),
        style: basicTextStyle(context).copyWith(
          color: _isDark(context) ? CupertinoColors.white : CS_HEADER_TEXT_COLOR,
          fontSize: CS_HEADER_FONT_SIZE,
        ),
      ),
      decoration: BoxDecoration(
        color: _isDark(context) ? backgroundColorDark : CS_HEADER_COLOR,
        border: Border(
          bottom: BorderSide(
            color: _isDark(context) ? CupertinoColors.inactiveGray : CS_BORDER_COLOR,
            width: _isDark(context) ? CS_BORDER_HEIGHT_DARK : CS_BORDER_HEIGHT_LIGHT,
          ),
        ),
      ),
    );
  }
}
