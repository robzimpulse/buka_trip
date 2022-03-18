import 'package:flutter/material.dart';
import 'package:buka_trip/infrastructure/index.dart';

class LoginForm extends StatelessWidget {

  final Size size;

  const LoginForm({
    Key? key,
    required this.size
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
            leftText: "Forgot Password",
            onTapLeftText: () => {
              Log.debug("on tap left")
            },
            rightText: "Create a new Account",
            onTapRightText: () => {
              Log.debug("on tap right")
            },
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                bottom: size.height * .01
            ),
          ),
          TranslucentButton(
            title: "Login",
            onTap: () => {
              Log.debug("on tap submit")
            },
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