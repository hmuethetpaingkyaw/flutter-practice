import 'package:counter_get_x/database/note_dao.dart';
import 'package:counter_get_x/database/note_table.dart';
import 'package:counter_get_x/screens/add_note_screen.dart';
import 'package:counter_get_x/screens/update_note_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final NoteDao noteDao = Get.find();
  List<Note> notes = [];
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floor Database'),
      ),
      body: noteList(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'add',
            onPressed: () {
              // await noteDao.addNote(Note('This is title', 'This is message'));
              Get.to(CreateNote());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            heroTag: 'delete',
            onPressed: () {
              noteDao.deleteAllNotes(notes);
            },
            child: const Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  Widget noteList() {
    return StreamBuilder<List<Note>>(
        stream: noteDao.getAllNotes(),
        builder: (_, data) {
          if (data.hasData) {
            notes = data.data!;
            return ListView.builder(
                itemCount: data.data!.length,
                itemBuilder: (_, position) {
                  return Card(
                    child: ListTile(
                      title: Text(data.data![position].title),
                      subtitle: Text(data.data![position].message),
                      leading: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Get.to(UpdateNote(), arguments: data.data![position]);
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          noteDao.deleteNote(data.data![position]);
                        },
                      ),
                    ),
                  );
                });
          } else if (data.hasError) {
            return const Text('Error');
          } else {
            return const Text('Loading');
          }
        });
  }
}
