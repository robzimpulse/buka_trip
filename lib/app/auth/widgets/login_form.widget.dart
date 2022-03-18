import 'package:buka_trip/infrastructure/widgets/translucent_button.widget.dart';
import 'package:buka_trip/infrastructure/widgets/translucent_multiple_button_horizontal.widget.dart';
import 'package:buka_trip/infrastructure/widgets/translucent_text_field.widget.dart';
import 'package:buka_trip/infrastructure/widgets/translucent_text_label.widget.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {

  final TextEditingController? emailController;
  final TextEditingController? passwordController;

  final Size size;
  final VoidCallback? onTapRegister;
  final VoidCallback? onTapForgetPassword;
  final VoidCallback? onTapSubmit;

  const LoginForm({
    Key? key,
    required this.size,
    this.onTapRegister,
    this.onTapForgetPassword,
    this.onTapSubmit,
    this.emailController,
    this.passwordController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TranslucentTextLabel(
            "Buka Trip",
            size: Size(size.width * 0.9, 44),
            margin: EdgeInsets.only(
                top: size.height * .02,
                bottom: size.height * .02
            ),
          ),
          TranslucentTextField(
            hintText: "Email",
            controller: emailController,
            icon: Icons.email_outlined,
            size: Size(size.width * 0.8, 44),
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .01
            ),
          ),
          TranslucentTextField(
            hintText: "Password",
            controller: passwordController,
            icon: Icons.lock_outline,
            size: Size(size.width * 0.8, 44),
            obscureText: true,
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .01
            ),
          ),
          TranslucentMultipleButtonHorizontal(
            size: Size(size.width * 0.8, 44),
            leftText: "Forgot Password",
            onTapLeftText: onTapForgetPassword,
            rightText: "Create a new Account",
            onTapRightText: onTapRegister,
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .01
            ),
          ),
          TranslucentButton(
            size: Size(size.width * 0.8, 44),
            disabled: onTapSubmit == null,
            title: "Login",
            onTap: onTapSubmit,
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                top: size.height * .02,
                bottom: size.height * .02
            ),
          )
        ],
      ),
    );
  }
}