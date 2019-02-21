part of flutter_cupertino_settings;

/// This widgets is used as a grouping separator.
/// The [title] attribute is optional.
class CSHeader extends StatelessWidget {
  final String title;
  CSHeader([this.title = '']);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
      child: Text(title.toUpperCase(),
          style: const TextStyle(
              color: CS_HEADER_TEXT_COLOR, fontSize: CS_HEADER_FONT_SIZE)),
      decoration: const BoxDecoration(
          color: CS_HEADER_COLOR,
          border:
              Border(bottom: BorderSide(color: CS_BORDER_COLOR, width: 1.0))),
    );
  }
}