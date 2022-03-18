import 'package:flutter/material.dart';

class DialogPresenter {
  static Future<void> alert(BuildContext context,{
    required String title,
    required String content,
  }) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: Text(title)),
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