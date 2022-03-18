import 'dart:async';
import 'dart:math';

import 'package:buka_trip/infrastructure/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {

  Duration duration = const Duration(seconds: 5);
  Timer? _timer;
  List<String> backgrounds = [
    'assets/images/sunset_background_image.jpeg',
    'assets/images/beach_background_image.jpeg'
  ];
  String background = "";
  final _random = Random();

  void changeBackground() {
    String newbg = backgrounds.elementAt(_random.nextInt(backgrounds.length));
    if (background != newbg) {
      setState(() { background = newbg; });
      Log.debug("changed background to $background");
    }
  }

  void startTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    } else {
      changeBackground();
      _timer = Timer.periodic(duration, (timer) { changeBackground(); });
    }
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ScrollConfiguration(
        behavior: BehaviourScroll(),
        child: SingleChildScrollView(
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                ImageBackground(assetPath: background, size: size),
                Center(
                  child: Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      Expanded(
                        flex: 7,
                        child: TranslucentCard(
                          width: size.width * .9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TranslucentTextLabel(
                                title: "Sign In",
                                padding: EdgeInsets.only(
                                  top: size.width * .15,
                                  bottom: size.width * .1,
                                ),
                              ),
                              SizedBox(height: size.width * .01),
                              TranslucentTextField(
                                hintText: 'Username',
                                icon: Icons.account_circle_outlined,
                                size: Size(size.width * .8, size.height / 12),
                                keyboardType: TextInputType.text,
                              ),
                              SizedBox(height: size.width * .01),
                              TranslucentTextField(
                                hintText: 'Email',
                                icon: Icons.email_outlined,
                                size: Size(size.width * .8, size.height / 12),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: size.width * .01),
                              TranslucentTextField(
                                hintText: 'Password',
                                icon: Icons.lock_outline,
                                size: Size(size.width * .8, size.height / 12),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              SizedBox(height: size.width * .02),
                              TranslucentMultipleButtonHorizontal(
                                leftText: "Forgot Password",
                                onTapLeftText: () => {
                                  Log.debug("on tap left")
                                },
                                rightText: "Create a new Account",
                                onTapRightText: () => {
                                  Log.debug("on tap right")
                                },
                              ),
                              SizedBox(height: size.width * .2),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  HapticFeedback.lightImpact();
                                  Log.debug("on tap sign in");
                                },
                                child: TranslucentTextLabel(
                                  title: 'Sign-In',
                                  size: Size(size.width * .8, size.height / 12),
                                  margin: EdgeInsets.only(
                                    bottom: size.width * .05
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}