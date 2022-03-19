import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class Logo extends StatefulWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  State<Logo> createState() => _LogoState();
}

class _LogoState extends State<Logo>
    with SingleTickerProviderStateMixin {
  late AnimationController _flipController;

  late Animation<double> animation;
  late Animation<double> flipAnimation;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 6000)
    );
    flipAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_flipController);
    timer = Timer(
        const Duration(milliseconds: 500), () => _flipController.repeat()
    );
  }

  @override
  void dispose() {
    _flipController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = (size.height > 600) ? size.height * 0.14 : size.height * 0.11;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 5),
      ),
      child: AnimatedBuilder(
        animation: flipAnimation,
        builder: (BuildContext context, Widget? child) => Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(-2 * pi * (flipAnimation.value)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(150),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.4),
                  maxRadius: MediaQuery.of(context).size.width * 0.12,
                  child: Image.asset('assets/icons/app_icon.png', width: width)
              ),
            ),
          ),
        ),
      ),
    );
  }
}