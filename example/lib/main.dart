import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cupertino Settings'),
      ),
      body: CupertinoSettings(
        items: <Widget>[
          CSHeader('Brightness'),
          CSWidget(
              new CupertinoSlider(
                value: _slider,
                onChanged: (double value) {
                  setState(() {
                    _slider = value;
                  });
                },
              ),
              style: CSWidgetStyle(icon: Icon(FontAwesomeIcons.sun))),
          CSControl(
            'Auto brightness',
            CupertinoSwitch(
              value: _switch,
              onChanged: (bool value) {
                setState(() {
                  _switch = value;
                });
              },
            ),
            style: CSWidgetStyle(icon: Icon(FontAwesomeIcons.sun)),
          ),
          CSHeader('Selection'),
          CSSelection(
            ['Day mode', 'Night mode'],
            (int value) {
              setState(() {
                _index = value;
              });
            },
            currentSelection: _index,
          ),
          CSHeader(""),
          CSControl('Loading...', CupertinoActivityIndicator()),
          CSButton(CSButtonType.DEFAULT, "Licenses", () {
            print("It works!");
          }),
          CSHeader(""),
          CSButton(CSButtonType.DESTRUCTIVE, "Delete all data", () {}),
        ],
      ),
    );
  }
}
