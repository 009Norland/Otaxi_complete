
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.yellow,
      ),
      body: Center(
        child: Text("Settings Page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
