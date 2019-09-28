part of flutter_cupertino_settings;

/// A button-cell inside [CupertinoSettings]
/// 3 different types are available (they only affect the design):
/// [CSButtonType.DESTRUCTIVE] Red and centered
/// [CSButtonType.DEFAULT] Blue and left aligned
/// [CSButtonType.DEFAULT_CENTER] Blue and centered
/// Provides the correct paddings and text properties
///
/// It is quite complex:
///
/// -- Widget
///   |- Flex
///     |- Expand
///       |- CupertinoButton
///         |- Container        (<--- For text-alignment)
///           |- Text
///
/// This "hack" is mandatory to archive that...
/// 1) The button can be aligned
/// 2) The entire row is touch-sensitive
class CSButton extends CSWidget {
  final CSButtonType type;
  final String text;
  final VoidCallback pressed;
  final double fontSize;

  CSButton(
    this.type,
    this.text,
    this.pressed, {
    CSWidgetStyle style = CS_DEFAULT_STYLE,
    this.fontSize = CS_HEADER_FONT_SIZE,
  }) : super(
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Container(
                    alignment: type.alignment,
                    child: Text(
                      text,
                      style: TextStyle(
                        color: type.color,
                        fontSize: fontSize,
                      ),
                    ),
                  ),
                  onPressed: pressed,
                ),
              ),
            ],
          ),
          style: style,
        );
}

/// Defines different types for [CSButton]
/// Specifies color and alignment
class CSButtonType {
  static const CSButtonType DESTRUCTIVE = CSButtonType(Colors.red, AlignmentDirectional.center);
  static const CSButtonType DEFAULT = CSButtonType(Colors.blue, AlignmentDirectional.centerStart);
  static const CSButtonType DEFAULT_CENTER = CSButtonType(Colors.blue, AlignmentDirectional.center);

  final Color color;
  final AlignmentGeometry alignment;

  const CSButtonType(this.color, this.alignment);
}
