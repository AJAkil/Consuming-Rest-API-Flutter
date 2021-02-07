import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {

  final String noteID;
  bool get isEditing => noteID != null;

  NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isEditing ?
            'Edit Note' : 'Create Note'
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            Container(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).primaryColor,
                    onPressed: () => Navigator.of(context).pop()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
