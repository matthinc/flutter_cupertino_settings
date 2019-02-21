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

  CSSelection(this.items, this.onSelected, {this.currentSelection = 0});

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
      widgets.add(createItem(items[i], i));
    }

    return Column(children: widgets);
  }

  Widget createItem(String name, int index) {
    return CSWidget(new CupertinoButton(
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
                child: Text(name,
                    style: const TextStyle(
                        fontSize: CS_ITEM_NAME_SIZE, color: CS_TEXT_COLOR))),
            Icon(Icons.check,
                color: (index == currentSelection
                    ? CS_CHECK_COLOR
                    : Colors.transparent),
                size: CS_CHECK_SIZE)
          ],
        )));
  }
}