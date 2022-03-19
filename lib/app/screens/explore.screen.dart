import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ExploreScreen();

}

class _ExploreScreen extends State<ExploreScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.greenAccent,
    );
  }
}