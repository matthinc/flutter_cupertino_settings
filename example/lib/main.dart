import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CSWidgetStyle brightnessStyle = const CSWidgetStyle(
      icon: const Icon(Icons.brightness_medium, color: Colors.black54));

  @override
  void initState() {
    super.initState();
  }

  double _slider = 0.5;
  bool _switch = false;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cupertino Settings'),
        ),
        body: CupertinoSettings(<Widget>[
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
              style: brightnessStyle),
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
            style: brightnessStyle,
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
          CSHeader(),
          CSControl('Loading...', CupertinoActivityIndicator()),
          CSButton(CSButtonType.DEFAULT, "Licenses", () {
            print("It works!");
          }),
          CSHeader(),
          CSButton(CSButtonType.DESTRUCTIVE, "Delete all data", () {})
        ]),
      ),
    );
  }
}
