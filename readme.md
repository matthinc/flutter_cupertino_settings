# flutter_cupertino_settings

![Pub badge](https://img.shields.io/pub/v/flutter_cupertino_settings.svg)  ![](https://img.shields.io/github/license/matthinc/flutter_cupertino_settings.svg)

A Flutter widget to create an iOS settings-table (static TableView).

[Get from Pub](https://pub.dartlang.org/packages/flutter_cupertino_settings#-installing-tab-)

- [x] Basic items (CSHeader, CSWidget, CSControl, CSButton, CSLink)
- [x] Support for icons
- [ ] Dynamic lists
- [ ] Item selection
- [ ] Themes



```dart

import 'package:flutter_cupertino_settings/flutter_cupertino_settings.dart';

CSWidgetStyle brightnessStyle = const CSWidgetStyle(
    icon: const Icon(Icons.brightness_medium, color: Colors.black54)
);

new CupertinoSettings(<Widget>[
    new CSHeader('Controls'),
    new CSWidget(new CupertinoSlider(value: 0.5), style: brightnessStyle),
    new CSControl('Auto brightness', new CupertinoSwitch(value: true), style: brightnessStyle),
    new CSHeader(),
    new CSControl('Loading...', new CupertinoActivityIndicator()),
    new CSLink('Miscellaneous', (){}),
    new CSHeader('Extra'),
    new CSControl('Version', new Text('1.0.0')),
    new CSControl('Author', new Text('Matthias Rupp')),
    new CSButton(CSButtonType.DEFAULT, "Licenses", (){}),
    new CSHeader(),
    new CSButton(CSButtonType.DESTRUCTIVE, "Delete all data", (){})
]);
```

![](http://abload.de/img/screenshotvgugp.png)
