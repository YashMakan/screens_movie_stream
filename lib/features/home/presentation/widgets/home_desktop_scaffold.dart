import 'package:flutter/material.dart';

class HomeDesktopScaffold extends StatefulWidget {
  const HomeDesktopScaffold({super.key});

  @override
  State<HomeDesktopScaffold> createState() => _HomeDesktopScaffoldState();
}

class _HomeDesktopScaffoldState extends State<HomeDesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
    );
  }
}
