part of flutter_cupertino_settings;

/// Used to display a widget of any kind in [CupertinoSettings]
/// It provices the correct height, color and border to create the intended look
/// The optional [alignment] attribute allows to specify the aligment inside the container
/// The optional [style] attribute allows to specify a style (e.g. an Icon)
class CSWidget extends StatelessWidget {
  final Widget widget;
  final AlignmentGeometry alignment;
  final double height;
  final CSWidgetStyle style;

  CSWidget(this.widget,
      {this.alignment,
      this.height = CS_ITEM_HEIGHT,
      this.style = CS_DEFAULT_STYLE});

  @override
  Widget build(BuildContext context) {
    Widget child;

    //style.icon
    if (style.icon != null) {
      child = Row(children: <Widget>[
        Container(
          child: style.icon,
          padding: CS_ICON_PADDING,
        ),
        Expanded(child: widget)
      ]);
    } else {
      child = widget;
    }

    return Container(
        alignment: alignment,
        height: height,
        padding: CS_ITEM_PADDING,
        decoration: const BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(color: CS_BORDER_COLOR, width: 1.0)),
        ),
        child: child);
  }
}

/// Defines style attributes that can be applied to every [CSWidget]
class CSWidgetStyle {
  final Icon icon;
  const CSWidgetStyle({this.icon});
}
