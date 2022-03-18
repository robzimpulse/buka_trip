import 'package:flutter/material.dart';
import 'package:buka_trip/infrastructure/index.dart';

class RegisterForm extends StatelessWidget {

  final TextEditingController? usernameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? passwordConfirmController;
  final Size size;
  final VoidCallback? onTapLogin;
  final VoidCallback? onTapForgetPassword;
  final VoidCallback? onTapSubmit;

  const RegisterForm({
    Key? key,
    required this.size,
    this.onTapLogin,
    this.onTapForgetPassword,
    this.onTapSubmit,
    this.usernameController,
    this.emailController,
    this.passwordController,
    this.passwordConfirmController
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
            hintText: "Username",
            controller: usernameController,
            icon: Icons.account_circle_outlined,
            size: Size(size.width * 0.8, 44),
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .01
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
          TranslucentTextField(
            hintText: "Confirm Password",
            controller: passwordConfirmController,
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
            rightText: "Already Have an Account?",
            onTapRightText: onTapLogin,
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .01
            ),
          ),
          TranslucentButton(
            size: Size(size.width * 0.8, 44),
            disabled: onTapSubmit == null,
            title: "Register",
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