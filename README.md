# EasyContainer For Flutter
[![pub package](https://img.shields.io/pub/v/easy_container.svg)](https://pub.dev/packages/easy_container)
[![likes](https://badges.bar/easy_container/likes)](https://pub.dev/packages/easy_container/score)
[![popularity](https://badges.bar/easy_container/popularity)](https://pub.dev/packages/easy_container/score)
[![pub points](https://badges.bar/easy_container/pub%20points)](https://pub.dev/packages/easy_container/score)

*An easy to use container for flutter with built in gesture detectors and a lot of customization.*

### Screenshots
<img src="https://user-images.githubusercontent.com/56810766/114513858-46929a00-9c58-11eb-9e17-99b3df0a5e92.png" height=600/>&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/56810766/114513863-46929a00-9c58-11eb-9870-f75a3c6963b1.png" height=600/>&nbsp;&nbsp;<img src="https://user-images.githubusercontent.com/56810766/114513854-45616d00-9c58-11eb-8618-8c9bead46cc2.png" height=600/>

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

If an onTap parameter is provided, it can be used as a button.
```dart
EasyContainer(
    child: Text("Hello World"),
    onTap: () => print("Hello World"),
),
```

Sample Usage
```dart
import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: EasyContainer(
              height: 150,
              child: Center(
                child: Text(
                  "Hello World ...",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              padding: const EdgeInsets.all(20),
              elevation: 10,
              onTap: () => print("Container Tapped"),
              margin: const EdgeInsets.all(20),
              borderRadius: 20,
              backgroundColor: Colors.orange,
            ),
          ),
        ),
      ),
    );
  }
}

```

See the [`example`](https://github.com/rithik-dev/easy_container/blob/master/example) directory for a complete sample app.

### Created & Maintained By `Rithik Bhandari`

* GitHub: [@rithik-dev](https://github.com/rithik-dev)
* LinkedIn: [@rithik-bhandari](https://www.linkedin.com/in/rithik-bhandari/)

