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
