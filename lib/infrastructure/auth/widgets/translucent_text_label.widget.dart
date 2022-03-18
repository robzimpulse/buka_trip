import 'package:flutter/material.dart';

class TranslucentTextLabel extends StatelessWidget {

  final String title;
  final EdgeInsetsGeometry? padding;

  const TranslucentTextLabel({
    Key? key,
    required this.title,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(.8),
        ),
      ),
    );
  }

}