import 'package:counter_get_x/database/note_dao.dart';
import 'package:counter_get_x/database/note_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNote extends StatelessWidget {
  UpdateNote({super.key});
  final TextEditingController title = TextEditingController();
  final TextEditingController message = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    Note note = Get.arguments;
    title.text = note.title;
    message.text = note.message;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Note'),
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(
                  hintText: 'Title', border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: message,
              decoration: const InputDecoration(
                  hintText: 'Message', border: OutlineInputBorder()),
            ),
            ElevatedButton(
              onPressed: () {
                noteDao.updateNote(Note(title.text, message.text, id: note.id));
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text('Update Note'),
            )
          ],
        ),
      ),
    );
  }
}
