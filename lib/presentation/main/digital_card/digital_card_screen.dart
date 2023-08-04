import 'package:flutter/material.dart';


class DigitalCardScreen extends StatefulWidget {
  const DigitalCardScreen({super.key});

  @override
  State<DigitalCardScreen> createState() => _DigitalCardScreenState();
}

class _DigitalCardScreenState extends State<DigitalCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Kartu Digital"),
    );
  }
}
