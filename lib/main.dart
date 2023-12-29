import 'package:counter_get_x/database/note_database.dart';
import 'package:counter_get_x/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FutureBuilder<NoteDatabase>(
        future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
        builder: (context, data) {
          if(data.hasData) {
            Get.put(data.data!.noteDao);
            return Home();
          }
          else if(data.hasError) {
            return const Text('Error');
          } else {
            return const Text('Loading');
          }
        },
        ),
    );
  }
}
