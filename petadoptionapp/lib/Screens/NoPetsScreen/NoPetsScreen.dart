import 'package:flutter/material.dart';

class Nopetsscreen extends StatefulWidget {
  const Nopetsscreen({super.key});

  @override
  State<Nopetsscreen> createState() => _NopetsscreenState();
}

class _NopetsscreenState extends State<Nopetsscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/nopets.png"),
          Text("No Pets Found"),
        ],
      ),
    );
  }
}
