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

class CSSelection<T> extends StatefulWidget {
  final List<CSSelectionItem<T>> items;
  final void Function(T selected) onSelected;
  final T currentSelection;
  final double fontSize;

  const CSSelection({
    this.items,
    this.onSelected,
    this.currentSelection,
    this.fontSize = CS_TITLE_FONT_SIZE,
  });

  @override
  State<StatefulWidget> createState() => CSSelectionState<T>(
        items,
        currentSelection ?? items.first.value,
        onSelected,
      );
}

/// [State] for [CSSelection]
class CSSelectionState<T> extends State<CSSelection> {
  T currentSelection;
  final void Function(T selected) onSelected;
  final List<CSSelectionItem<T>> items;

  CSSelectionState(
    this.items,
    this.currentSelection,
    this.onSelected,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map<Widget>((item) => createItem(context, item)).toList(),
    );
  }

  Widget createItem(BuildContext context, CSSelectionItem<T> item) {
    return CSWidget(
      CupertinoButton(
        onPressed: () {
          if (item.value != currentSelection) {
            setState(() => currentSelection = item.value);
          }
          HapticFeedback.selectionClick();
          onSelected(item.value);
        },
        pressedOpacity: 1.0,
        padding: const EdgeInsets.fromLTRB(4, 1, 2, 1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Text(
                item.text,
                style: TextStyle(
                  color: CupertinoColors.label.resolveFrom(context),
                  fontSize: widget.fontSize,
                ),
              ),
            ),
            Icon(
              CupertinoIcons.check_mark,
              color: item.value == currentSelection
                  ? CupertinoColors.activeBlue
                  : const Color(0x00000000),
              size: CS_CHECK_SIZE,
            ),
          ],
        ),
      ),
      addPaddingToBorder: items.last != item,
      showTopBorder: item.showTopBorder,
    );
  }
}

class CSSelectionItem<T> {
  final T value;
  final String text;
  final bool showTopBorder;

  const CSSelectionItem({
    this.value,
    this.text,
    this.showTopBorder = false,
  });
}
