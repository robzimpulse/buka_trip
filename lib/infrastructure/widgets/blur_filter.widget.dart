import 'dart:ui';

import 'package:flutter/widgets.dart';

class BlurFilter extends StatelessWidget {
  final double sigma;
  final BorderRadius borderRadius;
  final Widget child;

  const BlurFilter({
    Key? key,
    required this.sigma,
    required this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
        child: child,
      ),
    );
  }
}