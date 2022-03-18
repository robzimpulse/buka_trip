import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TranslucentMultipleButtonHorizontal extends StatelessWidget {

  final Size? size;
  final String? leftText;
  final String? rightText;
  final VoidCallback? onTapLeftText;
  final VoidCallback? onTapRightText;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  const TranslucentMultipleButtonHorizontal({
    Key? key,
    this.leftText,
    this.rightText,
    this.onTapLeftText,
    this.onTapRightText,
    this.margin,
    this.padding,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size?.width,
      height: size?.height,
      margin: margin,
      padding: padding,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: leftText,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                recognizer: TapGestureRecognizer()..onTap = () {
                    HapticFeedback.lightImpact();
                    onTapLeftText!();
                  },
              ),
            ),
            RichText(
              text: TextSpan(
                text: rightText,
                style: const TextStyle(color: Colors.white, fontSize: 12),
                recognizer: TapGestureRecognizer()..onTap = () {
                    HapticFeedback.lightImpact();
                    onTapRightText!();
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }

}