import 'package:flutter/material.dart';
import 'package:startup_namer_clean/ui/main_router/assembly/main_router_assembly.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator (Clean)',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MainRouterAssembly().scene
    );
  }
}
