import 'package:flutter/cupertino.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(
        brightness: Brightness.dark,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _slider = 0.5;
  bool _switch = false;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Cupertino Settings'),
      ),
      child: CupertinoSettings(
        items: <Widget>[
          const CSHeader('Brightness'),
          CSWidget(
            CupertinoSlider(
              value: _slider,
              onChanged: (double value) => setState(() => _slider = value),
            ),
            style: CSWidgetStyle(
              icon: Icon(FontAwesomeIcons.sun),
            ),
            addPaddingToBorder: true,
          ),
          CSControl(
            nameWidget: Text('Auto brightness'),
            contentWidget: CupertinoSwitch(
              value: _switch,
              onChanged: (bool value) => setState(() => _switch = value),
            ),
            style: CSWidgetStyle(
              icon: Icon(FontAwesomeIcons.sun),
            ),
            addPaddingToBorder: false,
          ),
          const CSHeader('Selection'),
          CSSelection<int>(
            items: const <CSSelectionItem<int>>[
              CSSelectionItem<int>(text: 'Day mode', value: 0),
              CSSelectionItem<int>(text: 'Night mode', value: 1),
            ],
            onSelected: (value) => setState(() => _index = value),
            currentSelection: _index,
          ),
          const CSDescription(
            'Using Night mode extends battery life on devices with OLED display',
          ),
          const CSHeader(""),
          CSControl(
            nameWidget: Text('Loading...'),
            contentWidget: const CupertinoActivityIndicator(),
          ),
          CSButton(CSButtonType.DEFAULT, "Licenses", () {
            print("It works!");
          }),
          const CSHeader(""),
          CSButton(CSButtonType.DESTRUCTIVE, "Delete all data", () {}),
        ],
      ),
    );
  }
}
