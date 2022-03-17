import 'package:flutter/material.dart';

class TranslucentTextLabel extends StatelessWidget {

  final Size size;
  final String title;

  const TranslucentTextLabel({
    Key? key,
    required this.size,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: size.width * .15,
        bottom: size.width * .1,
      ),
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