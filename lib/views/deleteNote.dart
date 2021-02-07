import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Warning'),
      content: Text('Are you sure?'),
      actions: [
        FlatButton(
          child: Text('Yes'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: Text('No'))
      ],
    );
  }
}
