import 'package:flutter/material.dart';
import 'package:flutter_app/models/noteForListing.dart';
import 'package:flutter_app/views/deleteNote.dart';
import 'package:flutter_app/views/noteModify.dart';

class NoteList extends StatelessWidget {
  final notes = [
    new NoteForListing("1", "Note 1", DateTime.now(), DateTime.now()),
    new NoteForListing("2", "Note 2", DateTime.now(), DateTime.now()),
    new NoteForListing("3", "Note 3", DateTime.now(), DateTime.now())
  ];

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => NoteModify()));
        },
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
                color: Colors.green,
              ),
          itemBuilder: (BuildContext context, index) {
            return Dismissible(
              background: Container(
                color: Colors.red,
                padding: EdgeInsets.all(10),
                child: Align(
                  child: Icon(Icons.delete, color: Colors.white,),
                  alignment: Alignment.centerLeft,
                ),
              ),
              key: ValueKey(notes[index].noteID),
              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {},
              confirmDismiss: (direction) async {
                final result = await showDialog(
                    context: context,
                    builder: (_) => NoteDelete()
                );
                print(result);
                return result;
              },
              child: ListTile(
                title: Text(
                  notes[index].noteTitle,
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                subtitle: Text(
                    'Last edited on ${formatDateTime(notes[index].lastEditDateTime)}'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => NoteModify(noteID: notes[index].noteID)));
                },
              ),
            );
          },
          itemCount: notes.length),
    );
  }
}
