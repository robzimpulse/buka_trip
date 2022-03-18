import 'package:flutter/material.dart';

class Dialog {
  static Future<void> alert(BuildContext context,{
    required String title,
    required String content,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(content)
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Dismiss"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }
}