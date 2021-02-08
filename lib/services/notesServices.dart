import 'package:flutter_app/models/noteForListing.dart';

class NotesService{

  List<NoteForListing> getNotesList(){
    return [
      new NoteForListing("1", "Note 1", DateTime.now(), DateTime.now()),
      new NoteForListing("2", "Note 2", DateTime.now(), DateTime.now()),
      new NoteForListing("3", "Note 3", DateTime.now(), DateTime.now())
    ];
  }
}