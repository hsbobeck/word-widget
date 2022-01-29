import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:word_widget/bloc/word.dart';

class DatabaseManager {
  Database? db;

  DatabaseManager();

  Future<void> loadDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "pt-en.sqlite3");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("database", "pt-en.sqlite3"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
    // open the database
    db = await openDatabase(path, readOnly: true);
    print('Loaded database');
  }

  Future<Word> getRandomWord() async {
    if (db == null) {
      await loadDatabase();
    }

    List<Map> list = await db!
        .rawQuery('SELECT * FROM simple_translation ORDER BY RANDOM() LIMIT 1');
    String wordText = list[0]['written_rep'];
    String descriptionText = list[0]['trans_list'];
    Word word = Word(word: wordText, description: descriptionText);
    return word;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var manager = DatabaseManager();
  await manager.loadDatabase();
  manager.getRandomWord();
}
