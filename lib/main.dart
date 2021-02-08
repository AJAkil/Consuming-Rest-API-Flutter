import 'package:flutter/material.dart';
import 'package:flutter_app/services/notesServices.dart';
import 'package:flutter_app/views/noteList.dart';
import 'package:get_it/get_it.dart';

void setupLocator(){
  // used for registering the Service Layer with a lazy singleton
  // now the service can be used anywhere I like it to be used.
  GetIt.instance.registerLazySingleton(() => NotesService());
}


void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NoteList(),
    );
  }
}
