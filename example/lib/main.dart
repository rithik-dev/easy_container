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
              padding: 20,
              elevation: 10,
              onTap: () => debugPrint("Container Tapped"),
              margin: 20,
              borderRadius: 20,
              color: Colors.red,
              child: const CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    );
  }
}
