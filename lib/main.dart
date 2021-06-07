import 'package:flutter/material.dart';
import 'package:startup_namer_clean/ui/startup_name_list/assembly/startup_name_list_assembly.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator (Bloc)',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: StartupNameListAssembly().scene
    );
  }
}
