import 'package:flutter/material.dart';
import 'package:flutter_app/models/noteForListing.dart';


class NoteList extends StatelessWidget {

  final notes = [
    new NoteForListing("1", "Note 1", DateTime.now(), DateTime.now()),
    new NoteForListing("2", "Note 2", DateTime.now(), DateTime.now()),
    new NoteForListing("3", "Note 3", DateTime.now(), DateTime.now())
  ];

  String formatDateTime(DateTime dateTime){
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(
                height: 1,
                color: Colors.green,
              ),
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(
                notes[index].noteTitle,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              subtitle: Text('Last edited on ${formatDateTime(notes[index].lastEditDateTime)}'),
            );
          },
          itemCount: notes.length),
    );
  }
}
