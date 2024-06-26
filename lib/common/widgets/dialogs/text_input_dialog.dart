import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextInputDialog {
  static Future<void> show(BuildContext context, String heading, Function(String) onTextEntered) async {
    String enteredText = '';

    final result = await showCupertinoDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(heading),
          content: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CupertinoTextField(
              onChanged: (value) {
                enteredText = value;
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child:  Text('Cancel', style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ),
            TextButton(
              onPressed: () {
                // Set the result to true to indicate that the user confirmed
                Navigator.of(context).pop(true);
              },
              child:  Text('OK', style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
            ),
          ],
        );
      },
    );

    // Check the result after the dialog has been dismissed
    if (result == true) {
      onTextEntered(enteredText);
    }
  }
}
