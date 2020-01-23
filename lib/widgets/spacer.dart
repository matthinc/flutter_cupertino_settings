part of flutter_cupertino_settings;

class CSSpacer extends StatelessWidget {
  final bool showBorder;

  const CSSpacer({
    Key key,
    this.showBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, top: 20.0, bottom: 5.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGroupedBackground.resolveFrom(context),
        border: Border(
          bottom: showBorder
              ? BorderSide(
                  color: CupertinoColors.opaqueSeparator.resolveFrom(context),
                )
              : BorderSide.none,
        ),
      ),
    );
  }
}
