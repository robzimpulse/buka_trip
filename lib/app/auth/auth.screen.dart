import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:buka_trip/infrastructure/index.dart';

import 'widgets/index.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthScreen();
}

class _AuthScreen extends State<AuthScreen> {

  Duration duration = const Duration(seconds: 5);
  Timer? _timer;
  List<String> backgrounds = [
    'assets/images/sunset_background_image.jpeg',
    'assets/images/beach_background_image.jpeg'
  ];
  String background = "";
  final _random = Random();
  bool isRegisterScreen = true;
  bool isForgetPassword = false;
  bool isLoading = false;

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
      backgroundColor: Colors.red,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: size.height,
          child: Center(
            child: Visibility(
              visible: isRegisterScreen,
              replacement: Visibility(
                visible: isForgetPassword,
                replacement: LoginForm(size: size),
                child: ForgetPasswordForm(size: size),
              ),
              child: RegisterForm(size: size)
            ),
          ),
        ),
      ),
    );
  }
}