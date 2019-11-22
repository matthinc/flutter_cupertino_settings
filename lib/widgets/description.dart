part of flutter_cupertino_settings;

class CSDescription extends StatelessWidget {
  final String description;
  final Color backgroundColorDark;

  const CSDescription(
    this.description, {
    this.backgroundColorDark = Colors.black12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(
        10,
        7.5,
        5,
        5,
      ),
      // color: _isDark(context) ? backgroundColorDark : CS_HEADER_COLOR_LIGHT,
      color: _isDark(context) ? CupertinoColors.systemBackground.resolveFrom(context) : CupertinoColors.secondarySystemBackground.resolveFrom(context),
      child: Text(
        description,
        style: basicTextStyle(context).copyWith(
          color: _isDark(context) ? CupertinoColors.lightBackgroundGray : CS_HEADER_TEXT_COLOR,
          fontSize: CS_DESCRIPTION_FONT_SIZE,
          height: 1.1,
        ),
      ),
    );
  }
}
