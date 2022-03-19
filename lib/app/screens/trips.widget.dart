import 'package:flutter/material.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TripsScreen();
}

class _TripsScreen extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
    );
  }
}