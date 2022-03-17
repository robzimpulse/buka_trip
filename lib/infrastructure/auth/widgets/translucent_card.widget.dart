import 'dart:ui';

import 'package:flutter/material.dart';

class TranslucentCard extends StatelessWidget {

  final Size? size;
  final Widget? child;

  const TranslucentCard({
    Key? key,
    this.size,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
        child: SizedBox(
          width: size?.width,
          child: child,
        ),
      ),
    );
  }

}