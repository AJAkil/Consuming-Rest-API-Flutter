import 'dart:convert';

import 'package:flutter_app/models/apiResponse.dart';
import 'package:flutter_app/models/noteForListing.dart';
import 'package:http/http.dart' as http;

class NotesService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {'apiKey': '7a80258b-97d4-4c86-829d-a8ad6ea41ec9'};

  Future<APIResponse<List<NoteForListing>>> getNotesList() {
    return http.get('API' + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body); // we have data as list of maps
        final notes = <NoteForListing>[];

        for (var item in jsonData) {
          final note = NoteForListing(
              item['noteID'],
              item['noteTitle'],
              DateTime.parse(item['createDateTime']),
              item['latestEditDateTime'] != null
                  ? DateTime.parse(item['latestEditDateTime'])
                  : null);
          notes.add(note);
        }
        return APIResponse<List<NoteForListing>>(data: notes);
      }

      return APIResponse<List<NoteForListing>>(error: true, errorMessage: 'Error occurred');
    })
    .catchError((_) => APIResponse<List<NoteForListing>>(error: true, errorMessage: 'Error occurred'));
  }
}
