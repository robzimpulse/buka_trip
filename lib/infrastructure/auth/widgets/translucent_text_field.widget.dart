import 'package:flutter/material.dart';

class TranslucentTextField extends StatelessWidget {

  final Size size;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? icon;
  final String? hintText;

  const TranslucentTextField({
    Key? key,
    required this.size,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: size.width / 30),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          style: TextStyle(color: Colors.white.withOpacity(.9)),
          obscureText: obscureText,
          keyboardType: keyboardType,
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