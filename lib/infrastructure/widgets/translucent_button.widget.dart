import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'index.dart';

class TranslucentButton extends StatelessWidget {

  final String title;
  final VoidCallback? onTap;
  final Size? size;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final bool disabled;

  const TranslucentButton({
    Key? key,
    required this.title,
    this.onTap,
    this.size,
    this.margin,
    this.padding,
    this.color,
    this.disabled = false
  }) : super(key: key);

  void _onTap() {
    HapticFeedback.lightImpact();
    onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      color: color,
      width: size?.width,
      height: size?.height,
      child: InkWell(
        splashFactory: disabled ? NoSplash.splashFactory : null,
        splashColor: Colors.grey,
        highlightColor: Colors.transparent,
        onTap: disabled ? null : _onTap,
        child: TranslucentTextLabel(
          title,
          titleColor: disabled ? Colors.grey : null,
        )
      ),
    );
  }

}