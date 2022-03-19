import 'package:flutter/material.dart';

class TranslucentTextField extends StatelessWidget {

  final Size? size;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? icon;
  final String? hintText;
  final EdgeInsetsGeometry? margin;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final bool enabled;
  final FormFieldValidator<String>? validator;

  const TranslucentTextField({
    Key? key,
    this.size,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.icon,
    this.hintText,
    this.margin,
    this.controller,
    this.enabled = true,
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size?.width,
        height: size?.height,
        alignment: Alignment.center,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          enabled: enabled,
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