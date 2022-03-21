import 'package:buka_trip/infrastructure/widgets/translucent_button.widget.dart';
import 'package:buka_trip/infrastructure/widgets/translucent_multiple_button_horizontal.widget.dart';
import 'package:buka_trip/infrastructure/widgets/translucent_text_field.widget.dart';
import 'package:buka_trip/infrastructure/widgets/translucent_text_label.widget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordForm extends StatelessWidget {

  const ForgetPasswordForm({
    Key? key,
    required this.size,
    this.onTapRegister,
    this.onTapLogin,
    this.onTapSubmit,
    this.emailController
  }) : super(key: key);

  final TextEditingController? emailController;
  final Size size;
  final VoidCallback? onTapRegister;
  final VoidCallback? onTapLogin;
  final VoidCallback? onTapSubmit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TranslucentTextLabel(
            'Buka Trip',
            size: Size(size.width * 0.9, 44),
            margin: EdgeInsets.only(
                top: size.height * .02,
                bottom: size.height * .02
            ),
          ),
          TranslucentTextField(
            hintText: 'Email',
            controller: emailController,
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
            leftText: 'Create a new Account',
            onTapLeftText: onTapRegister,
            rightText: 'Already Have an Account?',
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
            title: 'Submit',
            onTap: onTapSubmit,
            margin: EdgeInsets.only(
                left: size.width * .05,
                right: size.width * .05,
                top: size.height * .02,
                bottom: size.width * .05
            ),
          )
        ],
      ),
    );
  }
}