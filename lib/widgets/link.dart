part of flutter_cupertino_settings;

/// Provides a button for navigation
class CSLink extends CSWidget {
  final String text;
  final VoidCallback pressed;
  CSLink(this.text, this.pressed, {CSWidgetStyle style = CS_DEFAULT_STYLE})
      : super(
            CupertinoButton(
                padding: EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(text,
                        style: const TextStyle(
                            fontSize: CS_ITEM_NAME_SIZE, color: CS_TEXT_COLOR)),
                    const Icon(Icons.keyboard_arrow_right,
                        color: Colors.black26)
                  ],
                ),
                onPressed: pressed),
            style: style);
}
