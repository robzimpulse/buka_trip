import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TranslucentMultipleButtonHorizontal extends StatelessWidget {

  final String? leftText;
  final String? rightText;
  final VoidCallback? onTapLeftText;
  final VoidCallback? onTapRightText;

  const TranslucentMultipleButtonHorizontal({
    Key? key,
    this.leftText,
    this.rightText,
    this.onTapLeftText,
    this.onTapRightText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RichText(
              text: TextSpan(
                text: leftText,
                style: const TextStyle(color: Colors.white),
                recognizer: TapGestureRecognizer()..onTap = () {
                    HapticFeedback.lightImpact();
                    onTapLeftText!();
                  },
              ),
            ),
            RichText(
              text: TextSpan(
                text: rightText,
                style: const TextStyle(color: Colors.white),
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