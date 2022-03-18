import 'package:flutter/material.dart';

class TranslucentTextField extends StatelessWidget {

  final Size? size;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? icon;
  final String? hintText;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextInputAction textInputAction;
  final TextEditingController? controller;

  const TranslucentTextField({
    Key? key,
    this.size,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.icon,
    this.hintText,
    this.padding,
    this.margin,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size?.width,
        height: size?.height,
        alignment: Alignment.center,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          controller: controller,
          style: TextStyle(color: Colors.white.withOpacity(.9)),
          obscureText: obscureText,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.white.withOpacity(.8)),
            border: InputBorder.none,
            hintMaxLines: 1,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(.5),
            ),
          ),
        )
    );
  }

}