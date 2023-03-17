# [EasyContainer](https://pub.dev/packages/easy_container) For Flutter
[![pub package](https://img.shields.io/pub/v/easy_container.svg)](https://pub.dev/packages/easy_container)
[![likes](https://img.shields.io/pub/likes/easy_container)](https://pub.dev/packages/easy_container/score)
[![popularity](https://img.shields.io/pub/popularity/easy_container)](https://pub.dev/packages/easy_container/score)
[![pub points](https://img.shields.io/pub/points/easy_container)](https://pub.dev/packages/easy_container/score)
[![code size](https://img.shields.io/github/languages/code-size/rithik-dev/easy_container)](https://github.com/rithik-dev/easy_container)
[![license MIT](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

*An easy to use container for flutter with built in gesture detectors and a lot of customization.*

### Screenshots
<img src="https://user-images.githubusercontent.com/56810766/115352432-fc1f9900-a1d4-11eb-8c3a-79b2baa46104.png" height=600/>&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/56810766/119640316-1da81c00-be36-11eb-83fd-fcffda516f1e.gif" height=600/>

## Usage

To use this plugin, add [`easy_container`](https://pub.dev/packages/easy_container) as a dependency in your pubspec.yaml file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    easy_container:
```

First and foremost, import the widget.
```dart
import 'package:easy_container/easy_container.dart';
```

You can now add an [`EasyContainer`](https://github.com/rithik-dev/easy_container/blob/master/lib/easy_container.dart) widget to your widget tree and pass the child as the only required parameter to get started.
This widget will create a route between the source and the destination LatLng's provided.
```dart
EasyContainer(
    child: Text("Hello World"),
),
```

If an onTap, onLongPress etc. parameters are provided, it can be used as a button.
```dart
EasyContainer(
    child: Text("Hello World"),
    onTap: () => debugPrint("Hello World"),
),
```

Want to add some `padding`/`margin`/`borderRadius`?

Padding from all sides can be added by passing `padding` as a double.
If you want to customize padding, then use `customPadding` which expects `EdgeInsets` allowing for customization.

If `customPadding` is passed, `padding` is ignored.

Same applies for margin and borderRadius.
```dart
EasyContainer(
    child: Text("Hello World"),
    onTap: () => debugPrint("Hello World"),
    
    /// Shorthand for EdgeInsets.all(20)
    padding: 20,

    /// if customPadding passed, padding is ignored.
    /// Hence padding applied to container is 10 from all sides.

    customPadding: EdgeInsets.all(10),
),
```

The default `alignment` is center.
So the container tries to take as much space as possible.
To deny the same, you can set the `alignment` to null or specify height/width.
```dart
EasyContainer(
    child: Text("Hello World"),
    onTap: () => debugPrint("Hello World"),

    /// child not longer takes all the available space
    alignment: null,
),
```

To enable a border, `showBorder` must be true. Defaults to false.

If `showBorder` is true, parameters like borderColor, borderWidth, borderStyle come into play.
```dart
EasyContainer(
    child: Text("Hello World"),
    onTap: () => debugPrint("Hello World"),
    showBorder: true,
    borderWidth: 5,
    borderColor: Colors.red,
),
```

Sample Usage
```dart
import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

void main() => runApp(_MainApp());

class _MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: EasyContainer(
              height: 300,
              width: 300,
              child: const CircularProgressIndicator.adaptive(),
              padding: 20,
              elevation: 10,
              onTap: () => debugPrint("Container Tapped"),
              margin: 20,
              borderRadius: 20,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

```

And a lot more.... 
There is a lot of customization available which is self explanatory.
You can the read the full documentation [`here`](https://github.com/rithik-dev/easy_container/blob/master/lib/easy_container.dart).

See the [`example`](https://github.com/rithik-dev/easy_container/blob/master/example) directory for a complete sample app.

### Created & Maintained By `Rithik Bhandari`

* GitHub: [@rithik-dev](https://github.com/rithik-dev)
* LinkedIn: [@rithik-bhandari](https://www.linkedin.com/in/rithik-bhandari/)

