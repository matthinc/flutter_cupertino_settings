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
      color: _isDark(context) ? backgroundColorDark : CS_HEADER_COLOR,
      child: Text(
        description,
        style: TextStyle(
          color: _isDark(context) ? CupertinoColors.lightBackgroundGray : CS_HEADER_TEXT_COLOR,
          fontSize: CS_DESCRIPTION_FONT_SIZE,
          height: 1.1,
        ),
      ),
    );
  }
}
