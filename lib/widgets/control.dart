part of flutter_cupertino_settings;

/// A title [name] in combination with any widget [contentWidget]
/// extends [CSWidget]
/// Provides the correct paddings and text properties
class CSControl extends CSWidget {
  final String name;
  final Widget contentWidget;

  CSControl(this.name, this.contentWidget,
      {CSWidgetStyle style = CS_DEFAULT_STYLE})
      : super(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name,
                    style: const TextStyle(
                        fontSize: CS_ITEM_NAME_SIZE, color: CS_TEXT_COLOR)),
                contentWidget
              ],
            ),
            style: style);
}