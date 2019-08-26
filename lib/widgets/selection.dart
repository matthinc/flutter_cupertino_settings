part of flutter_cupertino_settings;

/// A selection view
/// Allows to select between multiple items
/// Every item is represented by a String
///
/// If an item is selected, onSelected is called with its index
///
/// eg:
/// items = ["hello","world","flutter"]
/// select "world"
///
/// onSelected(1)
class CSSelection extends StatefulWidget {
  final List<String> items;
  final SelectionCallback onSelected;
  final int currentSelection;
  final double fontSize;

  CSSelection(
    this.items,
    this.onSelected, {
    this.currentSelection = 0,
    this.fontSize = CS_HEADER_FONT_SIZE,
  });

  @override
  State<StatefulWidget> createState() {
    return CSSelectionState(items, currentSelection, onSelected);
  }
}

/// [State] for [CSSelection]
class CSSelectionState extends State<CSSelection> {
  int currentSelection;
  final SelectionCallback onSelected;
  final List<String> items;

  CSSelectionState(this.items, this.currentSelection, this.onSelected);

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgets = <Widget>[];
    for (int i = 0; i < items.length; i++) {
      widgets.add(createItem(context, items[i], i));
    }

    return Column(children: widgets);
  }

  Widget createItem(BuildContext context, String name, int index) {
    return CSWidget(
      CupertinoButton(
        onPressed: () {
          if (index != currentSelection) {
            setState(() => currentSelection = index);
            onSelected(index);
          }
        },
        pressedOpacity: 1.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                name,
                style: TextStyle(
                  color: _isDark(context) ? Colors.white : CS_TEXT_COLOR,
                  fontSize: widget.fontSize,
                ),
              ),
            ),
            Icon(
              Icons.check,
              color: index == currentSelection ? _isDark(context) ? Colors.white : CS_CHECK_COLOR : Colors.transparent,
              size: CS_CHECK_SIZE,
            ),
          ],
        ),
      ),
    );
  }
}
