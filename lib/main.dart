import 'package:flutter/material.dart';

import 'infrastructure/index.dart';
import 'app/index.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Translucent Login UI',
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    ),
  );
}
