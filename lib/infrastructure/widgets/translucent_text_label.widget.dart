import 'package:flutter/material.dart';

class TranslucentTextLabel extends StatelessWidget {

  final String title;
  final Size? size;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Decoration? decoration;

  const TranslucentTextLabel(this.title, {
    Key? key,
    this.margin,
    this.padding,
    this.size,
    this.decoration
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width,
      height: size?.height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      alignment: Alignment.center,
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