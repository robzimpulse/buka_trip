import 'package:flutter/material.dart';

import 'infrastructure/index.dart';
import 'app/index.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Buka Trip',
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
    ),
  );
}
