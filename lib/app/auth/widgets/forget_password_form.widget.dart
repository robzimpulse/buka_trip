import 'package:flutter/material.dart';
import 'package:buka_trip/infrastructure/index.dart';

class ForgetPasswordForm extends StatelessWidget {

  final Size size;
  final VoidCallback? onTapRegister;
  final VoidCallback? onTapLogin;
  final VoidCallback? onTapSubmit;

  const ForgetPasswordForm({
    Key? key,
    required this.size,
    this.onTapRegister,
    this.onTapLogin,
    this.onTapSubmit
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
          TranslucentMultipleButtonHorizontal(
            size: Size(size.width * 0.8, 44),
            leftText: "Create a new Account",
            onTapLeftText: onTapRegister,
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
            title: "Submit",
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