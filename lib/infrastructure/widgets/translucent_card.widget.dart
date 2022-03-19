import 'dart:ui';

import 'package:flutter/material.dart';

class TranslucentCard extends StatelessWidget {

  const TranslucentCard({
    Key? key,
    this.child,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
        child: SizedBox(
          width: width,
          height: height,
          child: child,
        ),
      ),
    );
  }

}