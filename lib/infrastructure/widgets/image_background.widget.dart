import 'package:flutter/cupertino.dart';

class ImageBackground extends StatelessWidget {

  final Size? size;
  final String assetPath;

  const ImageBackground({
    Key? key,
    this.size,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size?.height,
      width: size?.width,
      child: Image.asset(assetPath, fit: BoxFit.fill)
    );
  }
}