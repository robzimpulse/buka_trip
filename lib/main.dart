import 'package:flutter/material.dart';
import 'package:buka_trip/app/auth/auth.screen.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Buka Trip',
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    ),
  );
}
