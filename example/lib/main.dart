import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                strokeWidth: 3,
              ),
              padding: 20,
              elevation: 10,
              onTap: () => print("Container Tapped"),
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
