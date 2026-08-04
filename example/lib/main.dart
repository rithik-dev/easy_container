import 'package:easy_container/easy_container.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const _HomePage(),
    );
  }
}

class _HomePage extends StatelessWidget {
  const _HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EasyContainer')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // The simplest form: every parameter has a sensible default.
          const EasyContainer(child: Text('A plain container')),

          // Tappable. The elevation sinks while pressed, then springs back.
          EasyContainer(
            elevation: 10,
            onTap: () => _showSnackBar(context, 'Tapped'),
            onLongPress: () => _showSnackBar(context, 'Long pressed'),
            child: const Text('Tap or long-press me'),
          ),

          // Borders are opt-in via showBorder.
          const EasyContainer(
            showBorder: true,
            borderWidth: 2,
            borderColor: Colors.indigo,
            borderRadius: 16,
            child: Text('Bordered, 16px radius'),
          ),

          // `padding`/`margin` are shorthands; the `custom*` variants win.
          const EasyContainer(
            customPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            customMargin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
            color: Colors.amber,
            child: Text('Custom padding and margin'),
          ),

          // A null alignment stops the child expanding to fill the container.
          const EasyContainer(
            alignment: null,
            child: Text('alignment: null — shrink-wrapped'),
          ),

          // Fixed size, holding a non-text child.
          const EasyContainer(
            height: 120,
            width: 120,
            elevation: 6,
            child: CircularProgressIndicator.adaptive(),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 1),
        ),
      );
  }
}
