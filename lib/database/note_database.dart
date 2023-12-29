

// required package imports
import 'dart:async';
import 'package:counter_get_x/database/note_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'note_table.dart';
part 'note_database.g.dart';
@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase{
  NoteDao get noteDao;
}